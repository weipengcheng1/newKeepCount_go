package utils

import (
	"math"
)

type Page struct {
	LastPage  int `json:"lastPage"`
	NextPage  int `json:"nextPage"`
	NowPage   int `json:"nowPage"`
	TotalPage int `json:"totalPage"`
	Count     int `json:"count"`
	StartRow  int `json:"startRow"`
}

//计算上一页，下一页，总条数，起始位置，总页数

func Construct(nowPage, everyRow, count int) Page {

	var (
		page      Page
		totalPage int
		lastPage  int
		nextPage  int
		startRow  int
	)

	//总页数
	totalPage = int(math.Ceil(float64(count) / float64(everyRow)))



	//上一页
	if nowPage == 1 {
		lastPage = 1
	} else {
		lastPage = nowPage - 1
	}

	//下一页
	if nowPage < totalPage {
		nextPage = nowPage + 1
	} else {
		nextPage = totalPage
	}

	//起始位置
	startRow = (nowPage - 1) * everyRow

	//赋值
	page.Count = count
	page.NowPage = nowPage
	page.LastPage = lastPage
	page.NextPage = nextPage
	page.StartRow = startRow
	page.TotalPage = totalPage

	return page
}
