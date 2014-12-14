TokenHandler = require 'token-handler'

class FirebaseTokenHandler extends TokenHandler
  setReference: (@firebaseRef) ->

  oAuthMethod: ->
    if @native then 'authWithOAuthToken' else 'authWithOAuthPopup'

  fireAuthMethod: ->
    @firebaseRef[@oAuthMethod()]

  tokenReceived: (token) ->
    # Authenticate with Facebook using an existing OAuth 2.0 access token
    @fireAuthMethod() @authProviderName, token, @authHandler

TokenHandler.register 'firebase', FirebaseTokenHandler

module.exports = FirebaseTokenHandler