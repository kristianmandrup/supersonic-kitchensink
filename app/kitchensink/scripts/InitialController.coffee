angular
.module('kitchensink')
.controller 'InitialController', ($scope, supersonic, $timeout) ->

  $scope.supersonic = supersonic

  $scope.login = ->
    console.log 'login'
    supersonic.logger.log 'logging in'
    supersonic.ui.initialView.dismiss()

