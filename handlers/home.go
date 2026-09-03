package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// HomeHandler responds to the root route
func HomeHandler(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Hello from my AWS EC2 Go server from github! 🚀 (powered by Gin)",
	})
}
