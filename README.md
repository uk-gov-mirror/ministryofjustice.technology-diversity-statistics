# Technology & Diversity Statistics

This repo holds the core files for building the Technology & Diversity Statistics webpage. 

You can find the page here [https://ministryofjustice.github.io/technology-diversity-statistics/](https://ministryofjustice.github.io/technology-diversity-statistics/)

## How the build process has been approched

The idea behind this project is to use as little code as possible whilst achieving the desired result for the project and end user. This initial premise has led to the use of a GitHub action to perform the build and deployment process.

By using a GitHub action in this way we can perform continuous integration (CI) tasks in the background. 

## Deployment

Once a change has been either pushed to the main branch or, a PR has been merged into main, the following will take place:

- CI begins background tasks
- Install all required packages `npm install`
- Build css/js files and introduce libraries `npm run build` (laravel mix)
- Stage files from the `dist/` directory 
- Commit staged files
- Push new site files to the _orphaned_ `gh-pages` branch
