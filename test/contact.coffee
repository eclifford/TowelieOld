if typeof define isnt "function"
  requirejs = require("requirejs")
  require "./config"
  module = requirejs
else
  module = define

module ["require", "mocha", "chai", "sinon", "cs!source/javascripts/models/contact"], (require, mocha, chai, sinon, ContactModel) ->
  should = chai.should()
  describe "Contact Model", ->
    it "should have correct default values", ->
      contact = new ContactModel
      contact.get('photo').should.equal "/images/placeholder.png"      

    it "should not be null", ->
      contact = new ContactModel
      contact.should.not.equal(null)

    it "should be null", ->
      contact = new ContactModel
      contact.should.not.equal(true)

    it "to be called once", ->
      contact = new ContactModel
      spy = new sinon.spy
      contact.bind 'error', spy
      contact.set photo: ""
      spy.calledOnce.should.equal(true)

    # test "initialising with values", ->
    #     user_goal = new UserGoalModel
    #         goal: "play the guitar"
    #         status: UserGoalModel.STATUS_COMPLETED

    #     expect(user_goal.get 'goal').to.eql "play the guitar"
    #     expect(user_goal.get 'status').to.eql UserGoalModel.STATUS_COMPLETED

    # test "goal cannot be empty", ->
    #     user_goal = new UserGoalModel
    #     spy = new sinon.spy
    #     user_goal.bind 'error', spy

    #     user_goal.set goal: ""

    #     expect(spy.calledOnce).to.eql true
    #     expect(spy.getCall(0).args[1]).to.eql(
    #         "A UserGoalModel should always have goal text set.")
  #return {name:'Contact suite'}
