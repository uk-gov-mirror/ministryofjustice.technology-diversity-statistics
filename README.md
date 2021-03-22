# Technology & Diversity Statistics

This repo holds the core files for building the Technology & Diversity Statistics webpage. 

You can find the page here [https://ministryofjustice.github.io/technology-diversity-statistics/](https://ministryofjustice.github.io/technology-diversity-statistics/)

## How the build process has been approached

The idea behind this project is to use as little code as possible whilst achieving the desired result for the project and end user. This initial premise has led to the use of a GitHub Action to perform the build and deployment process, and the use of Docker to achieve a simple and effective development environment.

By using a GitHub action in this way we can perform continuous integration (CI) tasks in the background. 

## Development
### Requirements

The following services must be available on your system:

1. Docker
2. NodeJS

### Quick start

Open your terminal and run the following chained command. It will change to your home directory before cloning and build occurs.

```bash
cd ~ && git clone https://github.com/ministryofjustice/technology-diversity-statistics.git && cd technology-diversity-statistics && make build && make launch
```

### Commands explained

1. Clone this repo to your local machine and change directories.
    ```bash
    git clone https://github.com/ministryofjustice/technology-diversity-statistics.git
    cd technology-diversity-statistics
    ```

2. Build the project locally. This will bring in all required development libraries.
    ```bash
    make build
    ```

3. Build and run the docker image. Once Docker is running the site will automatically launch in your web browser and start a 'watch' session on your codebase.
    ```bash
    make launch
    ```

## Deployment

Once a change has been either pushed to the main branch or, a PR has been merged into main, the following will take place:

- CI begins background tasks
- Install all required packages `npm install`
- Build css/js files and introduce libraries `npm run build` (laravel mix)
- Stage files from the `dist/` directory 
- Commit staged files
- Push new site files to the _orphaned_ `gh-pages` branch

## Make commands

There are several `make` commands configured in the `Makefile`. These are mostly just convenience wrappers for longer or more complicated commands.

| Command           | Description                                                                                                                                                                                                                                   |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img width=380/>  | 
| `make build`      | Run the build script to install application dependencies and build assets. This will typically involve installing node packages and compiling SASS stylesheets.                                                                               |
| `make launch`     | Start docker in the background, launch the site in the systems default browser and begin a watch session (webpack) to monitor codebase changes.                                                                                               |
| `make clean`      | Alias of `git clean -xdf`. Restore the git working copy to its original state. This will remove uncommitted changes and ignored files.                                                                                                        |
| `make run`        | Alias of `docker-compose up`. Launch the application locally using `docker-compose`.                                                                                                                                                          |
| `make down`       | Alias of `docker-compose down`.                                                                                                                                                                                                               |
| `make bash`       | Open a bash shell on the docker container. The working directory will be the website root i.e. where your complied site files reside. The application must already be running (e.g. via `make launch` or `make run`) before this can be used. |
