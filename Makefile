benchmark:
	docker compose exec -u 0 bench bash -c "go run cmd/bench/main.go -target-url https://t.isucon.dev"

accessdb:
	docker compose exec -it mysql bash -c "mysql -pisucon -uisucon isuports"

restartapp:
	docker compose restart webapp

redis:
	docker compose exec redis redis-cli
