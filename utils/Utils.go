package utils

import (
	"time"
)

//StrFormatTime 解析字符串时间格式并
func StrFormatTime(str string) int64 {
	// 加载时区
	loc, err := time.LoadLocation("Asia/Shanghai")
	if err != nil {
		return 0
	}
	// 按照指定时区和指定格式解析字符串时间
	timeObj, err := time.ParseInLocation("2006-01-02 15:04:05", str, loc)
	if err != nil {
		return 0
	}

	return timeObj.Unix()
}
