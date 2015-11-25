chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
Helper = require('hubot-test-helper')

expect = chai.expect

helper = new Helper('../src/hubot-promote.coffee')

describe 'hubot-promote', ->
  room = null

  beforeEach ->
    room = helper.createRoom()
    @robot =
      respond: sinon.spy()

    require('../src/hubot-promote')(@robot)

  afterEach ->
    # Tear it down after the test to free up the listener.
    room.destroy()

  it 'registers a respond listener for promoting a user', ->
    expect(@robot.respond).to.have.been.calledWith(/promote ([^:]+):?/i)

  it 'responds promoting a user', ->
    sinon.stub room.robot.brain, "usersForFuzzyName" , () ->
      return [{ name: 'tom' }]

    room.user.say 'alice', 'hubot promote tom'

    expect(room.messages).to.eql [
            ['alice', 'hubot promote alice'],
            ['hubot', 'PONG']
    ]
