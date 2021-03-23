# Technology & Diversity Statistics

This repo holds the core files for building the Technology & Diversity Statistics webpage. 

You can find the page here:

[https://ministryofjustice.github.io/technology-diversity-statistics/](https://ministryofjustice.github.io/technology-diversity-statistics/)

### How the build process has been approached

The idea behind this project is to use as little code as possible to provide a simple development experience whilst also achieving an exemplary result for the end user.

The approach has led to the creation of an automated development and deployment system. This system uses Docker to achieve a simple and effective development environment and a GitHub Action to perform continuous integration (CI) tasks.

## Development
### Requirements

The following software must be available locally:

1. MacOS (or other [UNIX](https://en.wikipedia.org/wiki/Unix) based system with [POSIX](https://en.wikipedia.org/wiki/POSIX) compatibility) 
2. Docker
3. NodeJS (npm)
4. Git

### Quick start

Open your terminal and run the following chained command. It will change to your home directory before cloning and build occurs.

```bash
cd ~ && git clone https://github.com/ministryofjustice/technology-diversity-statistics.git && cd technology-diversity-statistics && make build && make launch
```

#### Commands explained

1. Clone this repo to your local machine and change directories.
    ```bash
    git clone https://github.com/ministryofjustice/technology-diversity-statistics.git
    cd technology-diversity-statistics
    ```

2. Build the project locally. This will bring in all required development libraries.
    ```bash
    make build
    ```

3. Build and run the docker image. Once Docker is running the site will automatically launch in your web browser. The terminal will complete by beginning a 'watch' session to monitor asset changes; assets will be compiled.
    ```bash
    make launch
    ```
_For more detail please view the `make` commands glossary below._

## Auto Deployment

Building a GitHub page has been made simple by using an action as our build service.

A build will trigger once a commit has been either pushed or merged (PR) into the main branch or, the action gets triggered manually from the Actions tab. The following will take place:

- GitHub Action begins background tasks:
  - Install all required packages `npm install`
  - Build css/js files and introduce libraries `npm run build` (laravel mix)
  - Stage files from the `dist/` directory 
  - Commit staged files
  - Push new site files to the _orphaned_ `gh-pages` branch
  - GitHub Pages rebuild and publish gets triggered by previous push

## Make commands

There are several `make` commands configured in the `Makefile`. These are mostly just convenience wrappers for longer or more complicated commands.

| Command           | Description                                                                                                                                                                                                                                              |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `make build`      | Run the build script to install application dependencies and build assets. This will typically involve installing node packages and compiling SASS stylesheets.                                                                                          |
| `make launch`     | Start docker in the background, launch the site in the systems default browser and begin a watch session (webpack) to monitor codebase changes.                                                                                                          |
| `make clean`      | Alias of `git clean -xdf`. Restore the git working copy to its original state. This will remove uncommitted changes and ignored files.                                                                                                                   |
| `make run`        | Alias of `docker-compose up`. Launch the application locally using `docker-compose`.                                                                                                                                                                     |
| `make down`       | Alias of `docker-compose down`.                                                                                                                                                                                                                          |
| `make bash` <img width=300/> | Open a bash shell on the docker container. The working directory will be the website root i.e. where your complied site files reside. The application must already be running (e.g. via `make launch` or `make run`) before this can be used. |
