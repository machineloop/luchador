require.config({
  waitSeconds: 6000,
  shim: { },
  map: {
    '*': {
      'coffee-script': 'lib/coffeescript/extras/coffee-script',
      'css':  'lib/require-css/css',
      'is':   'lib/require-is/is',
      'cs':   'lib/require-cs/cs',
      'less': 'lib/require-less/less',
      'jade': 'lib/require-jade/jade'
    }
  },
  paths: {
    'famous-polyfills': '../lib/famous-polyfills/index',
    famous: '../lib/famous',
    requirejs: '../lib/requirejs/require'
  }
});
require(['cs!app/main.litcoffee']);
