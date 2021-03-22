const _mix = require('laravel-mix');

let publicPath = './dist/';

if (!_mix.inProduction()) {
    publicPath += 'technology-diversity-statistics/';
}

_mix.sass('app/sass/app.scss', publicPath + 'css/')
    .sass('app/sass/ie-8.scss', publicPath + 'css/')
    .js('app/js/app.js', publicPath + 'js/')
    .copy('index.html', publicPath + 'index.html')
    .copy('README.ghp.md', publicPath + 'README.md')
    .copy('node_modules/govuk-frontend/govuk/assets', publicPath + 'assets/')
    .options({
        processCssUrls: false
    });
