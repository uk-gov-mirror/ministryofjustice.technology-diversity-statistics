const mix = require('laravel-mix');

mix.setPublicPath('./dist')
    .sass('app/sass/app.scss','css/')
    .js('app/js/app.js', 'js/');
