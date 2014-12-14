class TokenHandler
  constructor: (@authProviderName, @native = false) ->

    # default authhandler
  authHandler: (authObj) ->
    console.log 'received authObj', authObj

  setAuthHandler: (@authHandler) ->

  tokenReceived: (token) ->
    # console.log 'received token', token
    throw Error "TokenHandler subclass must implement tokenReceived"

  tokenError: (error) ->
    console.log 'Could not get access token', error

TokenHandler.prototype = xtend TokenHandler.prototype, Registry

module.exports = TokenHandler
