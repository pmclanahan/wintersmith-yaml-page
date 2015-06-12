async = require 'async'
fs = require 'fs'
yaml = require 'js-yaml'


readYAML = (filename, callback) ->
  ### Read and try to parse *filename* as YAML, *callback* with parsed object or error on fault. ###
  async.waterfall [
    (callback) ->
      fs.readFile filename, callback
    (buffer, callback) ->
      try
        rv = yaml.load buffer.toString()
        callback null, rv
      catch error
        error.filename = filename
        error.message = "parsing #{ path.basename(filename) }: #{ error.message }"
        callback error
  ], callback


module.exports = (env, callback) ->

  class YamlPage extends env.plugins.MarkdownPage
    ### Plugin that allows pages to be created with just metadata form a YAML file ###

  YamlPage.fromFile = (filepath, callback) ->
    async.waterfall [
      async.apply readYAML, filepath.full
      (metadata, callback) =>
        console.log metadata
        markdown = metadata.content or ''
        page = new this filepath, metadata, markdown
        callback null, page
    ], callback


  env.registerContentPlugin 'pages', '**/*.*(yml|yaml)', YamlPage

  callback()
