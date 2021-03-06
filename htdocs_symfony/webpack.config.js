/**
 *
 * @type {Encore}
 */
const Encore = require('@symfony/webpack-encore');

/**
 *
 * @type {{Compiler: Compiler} | StylelintWebpackPlugin}
 */
const StylelintPlugin = require('stylelint-webpack-plugin');

// Manually configure the runtime environment if not already configured yet by the "encore" command.
// It's useful when you use tools that rely on webpack.config.js file.
if (!Encore.isRuntimeEnvironmentConfigured()) {
    Encore.configureRuntimeEnvironment(process.env.NODE_ENV || 'dev');
}

Encore
.setOutputPath('public/build/')
.setPublicPath('/build')

.addEntry('shared', './assets/shared.js')
.addEntry('oc-style', './assets/app/oc-style.js')
.addEntry('bs4', './assets/bs4/bs4.js')
.addEntry('backend', './assets/backend/backend.js')

// When enabled, Webpack "splits" your files into smaller pieces for greater optimization.
.splitEntryChunks()
.enableSingleRuntimeChunk()
.cleanupOutputBeforeBuild()
.enableBuildNotifications()
.enableSourceMaps(!Encore.isProduction())
.enableVersioning(Encore.isProduction())

// enables @babel/preset-env polyfills
.configureBabelPresetEnv((config) => {
    config.useBuiltIns = 'usage';
    config.corejs = 3;
})

// enables Loaders
.enableSassLoader()
.enablePostCssLoader()

// https://symfony.com/doc/current/frontend/encore/copy-files.html#referencing-image-files-from-a-template
.copyFiles({
    from: './assets/app/images',

    // optional target path, relative to the output dir
    to: 'images/[path][name].[hash:8].[ext]',

    // only copy files matching this pattern
    pattern: /\.(png|jpg|jpeg)$/
})

.copyFiles({
    from: './assets/backend/images',

    // optional target path, relative to the output dir
    to: 'images/[path][name].[hash:8].[ext]',

    // only copy files matching this pattern
    pattern: /\.(png|jpg|jpeg)$/
})

.enableIntegrityHashes(Encore.isProduction())

.autoProvidejQuery()

.addPlugin(
    new StylelintPlugin({
        fix: true
    }))
;

module.exports = Encore.getWebpackConfig();
