package controllers

import (
	"crypto/tls"
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/httplib"
	"keep_count/models"
)

type UserController struct {
	beego.Controller
}

type Code struct {
	Code string
}
type LoginInfo struct {
	SessionKey string `json:"session_key"`
	Openid     string `json:"openid"`
}

// GetUserOpenid
// @Description: 获取用户微信凭证
// @receiver u *UserController
func (u *UserController) GetUserOpenid() {
	//接收参数
	var (
		code  Code
		err   error
		wxUrl string
		wxLog LoginInfo
	)

	data := u.Ctx.Input.RequestBody

	err = json.Unmarshal(data, &code)
	if err != nil {
		u.Data["json"] = ReturnError(10004, "登录状态参数错误")
		u.ServeJSON()
	}
	//拿到code值进行请求获取数据
	wxUrl = "https://api.weixin.qq.com/sns/jscode2session?appid=wx4480d5c5ad542ffb&secret=18b7e683fba1a14f9458d7096e6aeab1&js_code=" + code.Code + "&grant_type=authorization_code"

	req := httplib.Get(wxUrl)
	req.SetTLSClientConfig(&tls.Config{InsecureSkipVerify: true})

	str, err := req.String()
	if err != nil {
		u.Data["json"] = ReturnError(10004, "登录请求失败")
		u.ServeJSON()
	}
	_ = json.Unmarshal([]byte(str), &wxLog)

	u.Data["json"] = ReturnSuccess(0, "success", wxLog, 0)
	u.ServeJSON()
}

// RegUserInfo
// @Description: 注册用户
// @receiver u *UserController
func (u *UserController) RegUserInfo() {
	var (
		err  error
	)
	openid :=u.GetString("openid")
	fmt.Println(openid)
	if openid == "" {
		u.Data["json"] = ReturnError(10004, "用户登录信息错误1")
		u.ServeJSON()
	}
	//将用户信息保存进数据库
	err = models.RegUser(openid)
	if err != nil {
		u.Data["json"] = ReturnError(10004, "登录失败")
		u.ServeJSON()
	}

	u.Data["json"] = ReturnSuccess(0, "success", nil, 0)
	u.ServeJSON()

}
