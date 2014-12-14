class FaceBookAuthenticator extends Authenticator
  permissions: ->
    @options.permissions or ['public_info']

  login: ->
    @connector.login @permissions(), @loginSuccess, @loginError

  loginSuccess: (status) ->
    @connector.getAccessToken @tokenHandler.tokenReceived, @tokenHandler.tokenError

Authenticator = require 'authenticator'
Authenticator.register 'facebook', FaceBookAuthenticator

module.exports = FaceBookAuthenticator