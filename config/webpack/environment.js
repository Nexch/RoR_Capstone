const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'Jquery',
    JQuery: 'jquery',
    Popper: ['popper.js','default']
  })
)

module.exports = environment
