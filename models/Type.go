package models

import "github.com/astaxie/beego/orm"

type KeepTallyType struct {
	Id       int
	TypeName string
	TypeEn   string
}

type KeepTypeDirectory struct {
	Id          int
	TypeId      int
	TypeDirName string
	TypeDirIcon string
	TypeDirUser string
}

func init() {
	orm.RegisterModel(new(KeepTallyType), new(KeepTypeDirectory))
}

func GetTallyType() (int64, []KeepTallyType, error) {
	o := orm.NewOrm()

	var tallyType []KeepTallyType

	num, err := o.QueryTable("keep_tally_type").All(&tallyType, "id", "type_name", "type_en")

	//根据父级获取子集
	return num, tallyType, err

}
