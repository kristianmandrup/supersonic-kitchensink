class Authenticator
  constructor: (@connector, @tokenHandler, @options) ->
    # validate?

  login: ->
    # console.log 'Authenticator login'
    throw Error "Authenticator subclass must implement login"

  loginError: (error) ->
    console.log 'An error occurred logging the user in', error


xtend    = require 'xtend'
Registry = require 'registry'

Authenticator.prototype = xtend(Authenticator.prototype, Registry)

module.exports =
  Authenticator: Authenticator
