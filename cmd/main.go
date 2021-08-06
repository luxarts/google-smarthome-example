package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main(){
	router := initRouter()
	router.Run()
}

func initRouter() *gin.Engine{
	router := gin.Default()

	mapRoutes(router)

	return router
}

func mapRoutes(r *gin.Engine){
	r.GET("/ping", pingHandler)
}

func pingHandler(ctx *gin.Context){
	ctx.JSON(http.StatusOK, "ping")
}