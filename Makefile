benchmark:
	docker compose exec bench bash -c "go run cmd/bench/main.go -target-url https://t.isucon.dev"

accessdb:
	docker compose exec -it mysql bash -c "mysql -pisucon -uisucon isuports"
