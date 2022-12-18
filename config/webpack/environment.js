const { environment } = require('@rails/webpacker')
// const jquery = require('./plugins/jquery')
// environment.plugins.prepend('jquery', jquery)

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)

module.exports = environment
