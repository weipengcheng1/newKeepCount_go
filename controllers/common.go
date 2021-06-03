package controllers

import (
	"crypto/md5"
	"encoding/hex"
	"github.com/astaxie/beego"
	"time"
)

type CommonController struct {
	beego.Controller
}

type JsonStruct struct {
	Code  int         `json:"code"`
	Msg   string      `json:"msg"`
	Items interface{} `json:"items"`
	Count int64       `json:"count"`
}

//请求成功返回
func ReturnSuccess(code int, msg string, items interface{}, count int64) *JsonStruct {
	return &JsonStruct{Code: code, Msg: msg, Items: items, Count: count}

}

//请求错误返回
func ReturnError(code int, msg string) *JsonStruct {
	return &JsonStruct{Code: code, Msg: msg}
}

//字符串加密
func MD5V(str string) string {
	h := md5.New()
	h.Write([]byte(str + beego.AppConfig.String("md5code")))
	return hex.EncodeToString(h.Sum(nil))
}

//格式化时间
func DateFormat(times int64) string {
	timestamp := time.Unix(times, 0)
	return timestamp.Format("2006-01-02")
}
