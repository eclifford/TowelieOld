if typeof define isnt "function"
  module = require("requirejs")
else
  module = define

module ["require", "mocha", "chai", "sinon", "jquery", "cs!javascripts/plugins/jquery.plugin"], (require, mocha, chai, sinon, $) ->
  should = chai.should()

  describe 'Chainable', ->
    describe '$("div.element").pluginName()', ->
      it 'should return $("div.element") so that other jQuery methods can be chained also called upon', ->
        $jQueryElem = $("<div id='content'></div>")
        $jQueryElem.pluginName().should.eql $jQueryElem

  describe 'Plugin Options', ->
    describe '$.fn.pluginName.options', ->
      it 'should contain the default options', ->
        $.fn.pluginName.defaults.should.eql
          some: "options"
          also: "others"

    describe '$.fn.pluginName({some:"newOptions", also:"more"})', ->
      it 'should overwrite the default options that are mentioned', ->
        pluginObjectName = new PluginObjectName()
        pluginObjectName.init
          some: "newOptions"
          also: "more"
        pluginObjectName.options.should.eql
          some: "newOptions"
          also: "more"

    describe '$.fn.pluginName({some:"newOptions"})', ->
      it 'should overwrite the default options that are mentioned but, ignore ones that aren\'t', ->
        pluginObjectName = new PluginObjectName()
        pluginObjectName.init
          some: "newOptions"
        pluginObjectName.options.should.eql
          some: "newOptions"
          also: "others"