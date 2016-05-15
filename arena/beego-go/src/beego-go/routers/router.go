package routers

import (
	"beego-go/controllers"
	"github.com/astaxie/beego"
)

func init() {
		ns := beego.NewNamespace("/api/v1",
							beego.NSRouter("/fighters", &controllers.FightersController{}),
					)
		beego.AddNamespace(ns)
}
