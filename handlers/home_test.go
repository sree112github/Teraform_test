package handlers

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
)

	func TestHomeHandler(t *testing.T){
		gin.SetMode(gin.TestMode)

		r := gin.Default()
		r.GET("/", HomeHandler)

		req, _ := http.NewRequest(http.MethodGet, "/", nil)
		w := httptest.NewRecorder()

		r.ServeHTTP(w, req)

	  if w.Code != http.StatusOK {
			t.Errorf("Expected status code %d, got %d", http.StatusOK, w.Code)
	  }
	}