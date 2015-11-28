chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'
Helper = require('hubot-test-helper')

expect = chai.expect

helper = new Helper('../src/hubot-promote.coffee')

describe 'hubot-promote promote', ->
  room = null

  beforeEach ->
    room = helper.createRoom()
    sinon.stub room.robot.brain, "usersForFuzzyName" , () ->
      return [{ name: 'tom' }]
    sinon.stub room.robot, "random_bullshit_title" , () ->
      return 'bullshit title'
    sinon.stub room.robot, "random_bullshit_activity" , () ->
      return 'bullshit activity'

    room.user.say 'alice', 'hubot promote tom'

  afterEach ->
    room.destroy()

  it 'responds promoting a user', ->
    expect(room.messages).to.eql [
      ['alice', 'hubot promote tom'],
      ['hubot', 'I am really excited to announce that tom has been promoted to bullshit title. tom has helped to bullshit activity. Please join me in congratulating tom on the news! 🎊 🎉']
    ]

describe 'hubot-promote demote', ->
  room = null

  beforeEach ->
    room = helper.createRoom()
    sinon.stub room.robot.brain, "usersForFuzzyName" , () ->
      return [{ name: 'tom' }]
    sinon.stub room.robot, "random_bullshit_title" , () ->
      return 'bullshit title'
    sinon.stub room.robot, "random_bullshit_activity" , () ->
      return 'bullshit activity'

    room.user.say 'alice', 'hubot demote tom'

  afterEach ->
    room.destroy()

  it 'responds demoting a user', ->
    expect(room.messages).to.eql [
      ['alice', 'hubot demote tom'],
      ['hubot', 'The management has decided to demote tom from bullshit title in accordance with the company policies. This action is being taken as a result of a failure to bullshit activity.']
    ]
