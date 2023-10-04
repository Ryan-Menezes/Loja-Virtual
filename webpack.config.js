const path = require('path');
const isProduction = process.env.NODE_ENV == 'production';

const webpack = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

const config = {
    resolve: {
        alias: {
            jquery: 'jquery/src/jquery',
        }
    },
    entry: {
        site: [
            // JS
            './public/assets/js/entry.js',
            // './public/assets/js/libs/jquery.min.js',
            './public/assets/js/libs/plugins/lightbox/js/lightbox.min.js',
            './public/assets/js/libs/plugins/lightbox/js/lightbox-plus-jquery.min.js',
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.min.js',
            './public/assets/js/libs/jquery/jquery.validate.min.js',
            './public/assets/js/libs/bootstrap.min.js',
            './public/assets/js/libs/plugins/slick.min.js',
            './public/assets/js/libs/plugins/nouislider.min.js',
            './public/assets/js/libs/plugins/jquery.zoom.min.js',
            './public/assets/js/libs/plugins/jquery.maskedinput.min.js',
            './public/assets/js/site/script.js',
            './public/assets/js/all.js',
            './public/assets/js/site/main.js',

            // CSS
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.min.css',
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.structure.min.css',
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.theme.min.css',
            './public/assets/css/libs/bootstrap.min.css',
            './public/assets/js/libs/plugins/lightbox/css/lightbox.min.css',
            './public/assets/css/libs/slick.css',
            './public/assets/css/libs/slick-theme.css',
            './public/assets/css/libs/nouislider.min.css',
            './public/assets/css/libs/font-awesome.min.css',
            './public/assets/css/all.css',
            './public/assets/css/site/style.css',
            './public/assets/css/site/site.css',
        ],

        panel: [
            // JS
            './public/assets/js/entry.js',
            // './public/assets/js/libs/jquery/jquery.min.js',
            './public/assets/js/libs/plugins/lightbox/js/lightbox.min.js',
            './public/assets/js/libs/plugins/lightbox/js/lightbox-plus-jquery.min.js',
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.min.js',
            './public/assets/js/libs/jquery/jquery.validate.min.js',
            './public/assets/js/libs/plugins/jquery.maskedinput.min.js',
            './public/assets/js/libs/bootstrap/bootstrap.min.js',
            // './public/assets/js/libs/plugins/Trumbowyg/trumbowyg.min.js',
            './public/assets/js/libs/plugins/apexcharts.min.js',
            './public/assets/js/all.js',
            './public/assets/js/panel/main.js',

            // CSS
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.min.css',
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.structure.min.css',
            './public/assets/js/libs/jquery/jquery-ui/jquery-ui.theme.min.css',
            './public/assets/css/libs/bootstrap/bootstrap.min.css',
            './public/assets/js/libs/plugins/Trumbowyg/ui/trumbowyg.min.css',
            './public/assets/js/libs/plugins/lightbox/css/lightbox.min.css',
            './public/assets/css/libs/fontawesome/css/all.min.css',
            './public/assets/css/libs/fontawesome/css/brands.min.css',
            './public/assets/css/libs/fontawesome/css/fontawesome.min.css',
            './public/assets/css/libs/fontawesome/css/regular.min.css',
            './public/assets/css/libs/fontawesome/css/solid.min.css',
            './public/assets/css/libs/fontawesome/css/svg-with-js.min.css',
            './public/assets/css/libs/fontawesome/css/v4-shims.min.css',
            './public/assets/css/all.css',
            './public/assets/css/panel/config.css',
        ],

        auth: [
            // CSS
            './public/assets/css/libs/bootstrap/bootstrap.min.css',
            './public/assets/css/libs/fontawesome/css/all.min.css',
            './public/assets/css/libs/fontawesome/css/brands.min.css',
            './public/assets/css/libs/fontawesome/css/fontawesome.min.css',
            './public/assets/css/libs/fontawesome/css/regular.min.css',
            './public/assets/css/libs/fontawesome/css/solid.min.css',
            './public/assets/css/libs/fontawesome/css/svg-with-js.min.css',
            './public/assets/css/libs/fontawesome/css/v4-shims.min.css',
            './public/assets/css/all.css',
            './public/assets/css/panel/auth/config.css',
        ],
    },
    output: {
        path: path.resolve(__dirname, 'public', 'assets', 'dist'),
    },
    plugins: [
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery'
        }),
        new MiniCssExtractPlugin(),
    ].concat(isProduction ? [new MiniCssExtractPlugin()] : []),
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/i,
                loader: 'babel-loader',
            },
            {
                test: /\.(eot|svg|ttf|woff|woff2|png|jpg|gif)$/i,
                type: 'asset',
            },
            {
                test: /\.css$/i,
                use: [
                    isProduction ? MiniCssExtractPlugin.loader : 'style-loader',
                    'css-loader',
                ],
            }
        ],
    },
    optimization: {
        minimizer: [
            new CssMinimizerPlugin(),
            '...',
        ],
    },
};

module.exports = () => {
    if (isProduction) {
        config.mode = 'production';
    } else {
        config.mode = 'development';
    }

    return config;
};
