angular
.module('kitchensink')
.controller 'InitialController', ['$scope', 'supersonic', '$timeout', '$cordovaFacebook'],
  ($scope, supersonic, $timeout, $cordovaFacebook) ->

  $scope.supersonic = supersonic

  $scope.fakeLogin = ->
    console.log 'login'
    supersonic.logger.log 'logging in'
    supersonic.ui.initialView.dismiss()

  $scope.login = ->
    $cordovaFacebook.login(["public_profile"]).then (success) ->
      console.log 'login success!!!'
    , (err) ->
      console.log 'omg! login error or permissions denied.. ', err

