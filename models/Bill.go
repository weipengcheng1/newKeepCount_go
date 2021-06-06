package models

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"keep_count/utils"
	"time"
)

type KeepBillingRecords struct {
	Id         int     `json:"id"`
	TypeDirId  int     `json:"typeDirId"`
	UserId     int     `json:"userId"`
	BillMoney  float32 `json:"billMoney"`
	BillTime   int     `json:"billTime"`
	BillNote   string  `json:"billNote"`
	Type       string  `json:"type"`
	NowFormat  string  `json:"nowFormat"`
	CreateTime int     `json:"createTime"`
	LastTime   int     `json:"lastTime"`
}
type BillRecordsInfo struct {
	KeepBillingRecords
	TypeDirIcon string `json:"typeDirIcon"`
	TypeDirName string `json:"typeDirName"`
}
type BillList struct {
	PayMoney    string            `json:"payMoney"`
	IncomeMoney string            `json:"incomeMoney"`
	NowFormat   string            `json:"nowFormat"`
	Children    []BillRecordsInfo `json:"children"`
}

func init() {
	orm.RegisterModel(new(KeepBillingRecords))
}

// AddBillingRecords
// @Description:  添加账单
// @param id
// @param typeDirId
// @param userId
// @param billMoney
// @param billTime
// @param billNote
// @return int
// @return error
func AddBillingRecords(id, typeDirId, userId int, billMoney float32, billTime int, billNote, billType, format string) (int64, string, error) {

	//先连接数据库
	o := orm.NewOrm()

	//定义变量
	var (
		err   error
		count int64
	)
	//赋值
	bill := KeepBillingRecords{Id: id, TypeDirId: typeDirId, UserId: userId, BillMoney: billMoney, BillTime: billTime, BillNote: billNote, Type: billType, NowFormat: format}

	//判断该id是否等于0，如果等于0,就添加，否则就更新
	if bill.Id == 0 {
		bill.CreateTime = int(time.Now().Unix())
		bill.LastTime = int(time.Now().Unix())
		count, err = o.Insert(&bill)
		return count, "添加成功", err
	} else {
		bill.LastTime = int(time.Now().Unix())
		//先根据id查询当前记录信息
		isExist := IsBillExist(id)
		if isExist {
			//更新
			count, err = o.Update(&bill, "type_dir_id", "type", "now_format", "user_id", "bill_money", "bill_time", "bill_note", "last_time")
			return count, "更新成功", err
		} else {
			return 0, "更新失败", err
		}
	}
}
// GetBillCount
// @Description: 获取总条数
// @param uId
// @return int64
func GetBillCount(uId int) int64 {
	o := orm.NewOrm()
	count, _ := o.QueryTable("keep_billing_records").Filter("user_id", uId).GroupBy("now_format").Count()

	return count
}

// GetBillListByUserId
// @Description:  获取账单列表
// @param id
// @param startRow
// @param everyRow
// @return int
// @return []BillList
// @return error
func GetBillListByUserId(id int, startRow, everyRow int) (int, []BillList, error) {
	//用原生语句
	var billList []BillList
	var bill []BillRecordsInfo
	var Money struct {
		PayMoney    float32
		IncomeMoney float32
	}
	o := orm.NewOrm()
	//获取分组时间
	_, err := o.Raw("SELECT now_format FROM keep_billing_records  "+
		" WHERE user_id = ? "+
		" GROUP BY now_format order by now_format desc limit ?,? ", id, startRow, everyRow).QueryRows(&billList)

	if err != nil {
		return 0, nil, err
	}
	fmt.Println(billList)
	//根据分组时间获取给时间下的所有不同时间的订单，从00:00---23:59:59
	for index, val := range billList {
		//转换时间
		startTime := val.NowFormat + " 00:00:00"
		endTime := val.NowFormat + " 23:59:59"
		startStamp := utils.StrFormatTime(startTime)
		endStamp := utils.StrFormatTime(endTime)
		//获取当前日期下的订单
		_, err = o.Raw("select kbr.id,kbr.type_dir_id,kbr.user_id,kbr.bill_money,kbr.bill_time,kbr.bill_note,kbr.create_time,kbr.last_time,kbr.type,kbr.now_format, ktd.type_dir_name, ktd.type_dir_icon from keep_billing_records kbr"+
			" left join keep_type_directory ktd on ktd.id = kbr.type_dir_id "+
			" where user_id = ? and  bill_time between ? and ? ", id, startStamp, endStamp).QueryRows(&bill)
		billList[index].Children = bill
		//获取当前日期支出和收入总和
		//支出
		err = o.Raw("SELECT sum(bill_money) as 'pay_money'  FROM keep_billing_records  where user_id = ? and now_format = ? and type=? ", id, val.NowFormat, "pay").QueryRow(&Money)
		billList[index].PayMoney = fmt.Sprintf("%.2f", Money.PayMoney)
		//收入
		err = o.Raw("SELECT sum(bill_money) as 'income_money' FROM keep_billing_records  where user_id = ? and now_format = ? and type=?", id, val.NowFormat, "income").QueryRow(&Money)
		billList[index].IncomeMoney = fmt.Sprintf("%.2f", Money.IncomeMoney)
	}
	return 0, billList, err
}

// IsBillExist
// @Description: 判断账单是否从存在
// @param id
// @return bool
func IsBillExist(id int) bool {
	o := orm.NewOrm()

	bill := KeepBillingRecords{Id: id}

	err := o.Read(&bill, "id")

	if err == orm.ErrNoRows {
		return false
	} else if err == orm.ErrMissPK {
		return false
	}
	return true
}
