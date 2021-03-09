const mix = require('laravel-mix');

mix.setPublicPath('./dist')
    .sass('app/sass/app.scss','css/')
    .sass('app/sass/ie-8.scss','css/')
    .js('app/js/app.js', 'js/')
    .copy('index.html', 'dist/index.html')
    .copy('README.ghp.md', 'dist/README.md')
    .copy('node_modules/govuk-frontend/govuk/assets', 'dist/assets/');
