package controllers

import (
	"github.com/astaxie/beego"
	"keep_count/models"
)

type TypeController struct {
	beego.Controller
}

func (t *TypeController) GetTypeList() {
	//获取父级列表
	count, tallyType, err := models.GetTallyType()

	if err != nil {
		t.Data["json"] = ReturnError(10004, "获取记账类型失败！")
		t.ServeJSON()
	}
	t.Data["json"] = ReturnSuccess(0, "success", tallyType, count)
	t.ServeJSON()
}
