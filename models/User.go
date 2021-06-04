package models

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type KeepUser struct {
	Id           int
	UserName     string
	Openid       string
	HeadPortrait string
	CreateTime   int64
	lastTime     int64
}

func init() {
	orm.RegisterModel(new(KeepUser))
}

// GetUserInfo
// @Description:  获取用户信息
// @param openid int
// @return int
// @return User
// @return error
func GetUserInfo(openid string) (int, KeepUser, error) {
	//创建orm
	var (
		count int
		user  KeepUser
		err   error
	)
	o := orm.NewOrm()
	//链接数据库
	err = o.QueryTable("keep_user").Filter("openid", openid).One(&user, "id", "openid", "user_name", "head_portrait")
	return count, user, err
}

func RegUser(openid string) error {
	var (
		err   error
		user  KeepUser
	)

	o := orm.NewOrm()

	//查询当前openid是否存在
	user.Openid = openid
	err = o.QueryTable("keep_user").Filter("openid", openid).One(&user, "id")
	if err == orm.ErrNoRows {
		//查询当前用户是否存在
		createTime := time.Now().Unix()
		lastTime := time.Now().Unix()
		user.CreateTime = createTime
		user.lastTime = lastTime
		_, err := o.Insert(&user)
		return err
	}
	return nil
}
