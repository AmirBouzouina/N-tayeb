const mix = require('laravel-mix');

/*
|--------------------------------------------------------------------------
| Mix Asset Management
|--------------------------------------------------------------------------
|
| Mix provides a clean, fluent API for defining some Webpack build steps
| for your Laravel application. By default, we are compiling the Sass
| file for the application as well as bundling up all the JS files.
|
*/





 const CompressionPlugin = require('compression-webpack-plugin');

 

   plugins: [
     new LiveReloadPlugin(),
     new webpack.ProvidePlugin({
       jQuery: 'jquery',
     }),
     new CompressionPlugin({
       asset: "[path].gz[query]",
       algorithm: "gzip",
       test: /\.js$|\.css$|\.html$|\.svg$/,
       threshold: 10240,
       minRatio: 0.8
     })
   ],
 });

 mix.js('resources/assets/js/app.js', 'public/assets/js')
   .sass('resources/assets/sass/app.scss', 'public/assets/styles')
   .copyDirectory('resources/assets/img', 'public/assets/img')
   .copyDirectory('resources/assets/fonts', 'public/assets/fonts')

 .version();
