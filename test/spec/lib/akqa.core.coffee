# ((root, factory) ->
#   if typeof exports is "object"
#     module.exports = factory(
#       require("mocha"), 
#       require("chai"),
#       require("sinon"), 
#       require('../../../source/javascripts/lib/akqa/akqa.core'))
#   else if typeof define is "function" and define.amd
#     define ["mocha", "chai", "sinon", "cs!core"], factory
#   else
#     root.returnExports = factory(root.b)
# ) this, (mocha, chai, sinon, Core) ->

#   should = chai.should()
#   console.log should

#   describe "AKQA.Core", ->
#     it "test should call subscriber", ->
#       spy = new sinon.spy 
#       Core.subscribe('testChannel', spy)
#       Core.publish('testChannel')
#       spy.calledOnce.should.equal(true)

#     it "should not be null", ->
#       Core.should.not.equal(null)

