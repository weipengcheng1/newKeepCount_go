package controllers

import (
	"encoding/json"
	"github.com/astaxie/beego"
	"keep_count/models"
	"keep_count/utils"
)

type BillController struct {
	beego.Controller
}

//AddBillRecords 添加账单
func (b *BillController) AddBillRecords() {
	//接收参数
	var (
		err   error
		count int64
		msg   string
		bill  struct {
			Id        int
			InputVal  float32
			NoteValue string
			NowDate   int
			Type      string
			TypeId    int
			Openid    string
			NowFormat string
		}
	)
	body := b.Ctx.Input.RequestBody

	err = json.Unmarshal(body, &bill)
	if err != nil {
		b.Data["json"] = ReturnError(10004, "系统参数错误")
		b.ServeJSON()
	}
	//进行必填参数判断
	if bill.Openid == "" {
		b.Data["json"] = ReturnError(10004, "用户信息错误")
		b.ServeJSON()
	}
	if bill.InputVal == 0 {
		b.Data["json"] = ReturnError(10004, "输入的金额格式不对")
		b.ServeJSON()
	}
	if bill.TypeId == 0 {
		b.Data["json"] = ReturnError(10004, "请选择账单分类")
		b.ServeJSON()
	}
	//根据openid获取用户id
	_, user, err := models.GetUserInfo(bill.Openid)
	if err != nil {
		b.Data["json"] = ReturnError(10004, "用户信息错误")
		b.ServeJSON()
	}

	//提交
	count, msg, err = models.AddBillingRecords(bill.Id, bill.TypeId, user.Id, bill.InputVal, bill.NowDate, bill.NoteValue, bill.Type, bill.NowFormat)
	if err != nil {
		b.Data["json"] = ReturnError(10004, "记账失败")
		b.ServeJSON()
	}

	b.Data["json"] = ReturnSuccess(0, msg, nil, count)
	b.ServeJSON()
}

func (b *BillController) GetBillList() {
	openid := b.GetString("openid", "")
	page, _ := b.GetInt("page", 1)
	if openid == "" {
		b.Data["json"] = ReturnError(10004, "参数错误")
		b.ServeJSON()
	}

	_, user, err := models.GetUserInfo(openid)
	if err != nil {
		b.Data["json"] = ReturnError(10004, "用户信息错误")
		b.ServeJSON()
	}
	//计算分页信息
	everyRow := 3
	//获取count
	count := models.GetBillCount(user.Id)
	//根据count,everyRow,page获取分页信息
	pageInfo := utils.Construct(page, everyRow, int(count))

	_, list, err := models.GetBillListByUserId(user.Id, pageInfo.StartRow, everyRow)
	if err != nil {
		b.Data["json"] = ReturnError(10004, "账单信息错误")
		b.ServeJSON()
	}
	b.Data["json"] = ReturnSuccess(0, "success", struct {
		List     []models.BillList `json:"list"`
		PageInfo utils.Page`json:"pageInfo"`
	}{List: list, PageInfo: pageInfo}, 0)
	b.ServeJSON()
}
