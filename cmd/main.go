package main

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"os"
)

func main(){
	port := os.Getenv("PORT")
	if port == "" {
		log.Fatal("PORT must be set")
	}

	router := initRouter()
	router.Run(":"+port)
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