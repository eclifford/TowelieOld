if typeof define isnt "function"
  module = require("requirejs")
else
  module = define

requirejs ["mocha", "chai", "sinon", "cs!core"], (mocha, chai, sinon, Core) ->
  should = chai.should()
  console.log should

  describe "AKQA.Core", ->
    it "test should call subscriber", ->
      spy = new sinon.spy 
      Core.subscribe('testChannel', spy)
      Core.publish('testChannel')
      spy.calledOnce.should.equal(true)

    it "should not be null", ->
      Core.should.not.equal(null)


