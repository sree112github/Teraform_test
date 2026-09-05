package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"github.com/sree112github/Teraform_test/handlers"
)

func main() {
	// Initialize a new Gin router
	r := gin.Default()

	// Register routes
	r.GET("/", handlers.HomeHandler)

	// Run the server on port 8080
	log.Println("Server running on port 8080")
	if err := r.Run(":8080"); err != nil {
		log.Fatal(err)
	}
}
