package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"keep_count/models"
)

type TypeController struct {
	beego.Controller
}

func (t *TypeController) GetTypeList() {
	//获取参数
	openid := t.GetString("openid", "")
	//先获取当前用户的openid
	var userId int
	if openid != "" {
		//调用获取user方法
		_, user, err := models.GetUserInfo(openid)
		if err != nil {
			userId = 0
		} else {
			userId = user.Id
		}
	}
	//获取父级列表
	count, tallyType, err := models.GetTallyType(userId)
	fmt.Println(err)
	if err != nil {
		t.Data["json"] = ReturnError(10004, "获取记账类型失败！")
		t.ServeJSON()
	}
	t.Data["json"] = ReturnSuccess(0, "success", tallyType, count)
	t.ServeJSON()
}
