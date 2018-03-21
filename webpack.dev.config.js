const webpack = require('webpack');

module.exports = {
  entry: {
    all: __dirname + '/assets/js/index.js',
  },
  resolve: {
    root: __dirname + '/assets/js',
  },
  output: {
    path: __dirname + '/src/assets',
    filename: '[name].js',
    publicPath: '/assets',
  },
  module: {
    loaders: [
      {
        test: /.*\.sass$/,
        loaders: ['style', 'css', 'sass', 'import-glob']
      },
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: { presets: ['es2015'] }
      }
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify(process.env.NODE_ENV),
      }
    }),
  ],
  devServer: {
    port: 3000,
    inline: true,
    stats: 'minimal'
  },
};

