if typeof define isnt "function"
  requirejs = require("requirejs")
  require "./config"
  module = requirejs
else
  module = define

module ["require", "mocha", "chai", "sinon", "cs!core"], (require, mocha, chai, sinon, Core) ->
  should = chai.should()

  describe "AKQA.Core", ->
    it "test should call subscriber", ->
      spy = new sinon.spy 
      Core.subscribe('testChannel', spy)
      Core.publish('testChannel')
      spy.calledOnce.should.equal(true)

