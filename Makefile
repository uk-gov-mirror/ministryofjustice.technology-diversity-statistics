default: build

# Run the project build script
build:
	bin/build.sh

# Launch the application, open browser, no stdout
launch:
	bin/launch.sh

# Run the project build script
watch:
	npm run watch

# Remove ignored git files – e.g. composer dependencies and built theme assets
# But keep .env file, .idea directory (PhpStorm config), and uploaded media files
clean:
	@if [ -d ".git" ]; then git clean -xdf --exclude ".env" --exclude ".idea" --exclude "web/app/uploads"; fi

# Remove all ignored git files (including media files)
deep-clean:
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
