default: build

# Run the project build script
build:
	bin/build.sh

# Launch the application, open browser, no stdout
launch:
	bin/launch.sh

# Remove ignored git files – e.g. built theme assets
# But keep .idea directory (PhpStorm config)
clean:
	@if [ -d ".git" ]; then git clean -xdf --exclude ".idea"; fi

# Run the application
run:
	docker-compose up

# Stop the application
down:
	docker-compose down

# Open a bash shell on the running container
bash:
	docker-compose exec -w /usr/share/nginx/html/technology-diversity-statistics web-service bash
