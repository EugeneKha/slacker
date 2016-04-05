package main

import (
	"fmt"
	"net/http"
	"log"
	"os"
	"time"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		name, _ := os.Hostname()
		fmt.Fprintf(w, "Hello from Eugene!!! %v\n", name)
		fmt.Printf("Hello from Eugene!!! %v\n", time.Now())
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
