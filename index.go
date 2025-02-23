package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, World! This is a CI/CD Pipeline Test. and CICD has deployed successfully..!!! done by sathwik and gowtham ❤️💩🫡📱🫨💀😘🈲🈹🈵🈴")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Starting server on :8080...")
	http.ListenAndServe(":8080", nil)
}
