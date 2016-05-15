package controllers

import (
	"github.com/astaxie/beego"
)

type FightersController struct {
	beego.Controller
}

type FightersJson struct {
  Name string `json:"name"`
}

func (c *FightersController) Get() {
  var responseJson FightersJson
  responseJson = FightersJson{
    Name: "John Doe",
  }
  // [{ name: "John Doe" }, { name: "Foo Bar" }, { name: "Sir Gey" }]
  c.Data["json"] = responseJson
  c.ServeJSON()
}
