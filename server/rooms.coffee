import {checkId} from '../lib/id.coffee'

Meteor.publish 'room', (room) ->
  checkId room, 'room'
  [
    Rooms.find _id: room
    Remotes.find room: room
    Objects.find room: room
  ]
