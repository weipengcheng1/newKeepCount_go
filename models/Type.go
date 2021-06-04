package models

import (
	"github.com/astaxie/beego/orm"
)

type KeepTallyType struct {
	Id       int    `json:"id"`
	TypeName string `json:"typeName"`
	TypeEn   string `json:"typeEn"`
}

type KeepTypeDirectory struct {
	Id          int    `json:"id"`
	TypeId      int    `json:"typeId"`
	TypeDirName string `json:"typeDirName"`
	TypeDirIcon string `json:"typeDirIcon"`
	TypeDirUser string `json:"typeDirUser"`
}
type TypeList struct {
	Id       int                 `json:"id"`
	TypeName string              `json:"typeName"`
	TypeEn   string              `json:"typeEn"`
	Children []KeepTypeDirectory `json:"children"`
}

func init() {
	orm.RegisterModel(new(KeepTallyType), new(KeepTypeDirectory))
}

// GetTallyType
// @Description: 获取记账类型及子类
// @param userId int
// @return int64
// @return []TypeList
// @return error
func GetTallyType(userId int) (int64, []TypeList, error) {
	o := orm.NewOrm()

	var tallyType []KeepTallyType

	num, err := o.QueryTable("keep_tally_type").All(&tallyType, "id", "type_name", "type_en")

	//根据父级获取子集
	var keepTypeDirectory []KeepTypeDirectory
	var typeList []TypeList
	for _, val := range tallyType {
		//循环获取值
		_, _ = o.QueryTable("keep_type_directory").Filter("type_id", val.Id).Filter("type_dir_user__in", 0, userId).All(&keepTypeDirectory, "id", "type_dir_name", "type_dir_icon", "type_dir_user")

		list := TypeList{Id: val.Id, TypeName: val.TypeName, TypeEn: val.TypeEn, Children: keepTypeDirectory}

		typeList = append(typeList, list)
	}
	return num, typeList, err

}
