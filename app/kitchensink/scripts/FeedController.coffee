angular
.module('kitchensink')
.controller 'FeedController', ['$scope', 'supersonic', '$cordovaFacebook'],
  ($scope, supersonic, $cordovaFacebook) ->

    validateFeed = (feed) ->
      return true if feed.link # and ...
      false

    invalidFeedWarning = (feed) ->
      $scope.invalidFeed = 'Invalid feed data'

    feedOptions = (feed) ->
      method:       'feed'
      link:         feed.link
      source:       feed.source
      caption:      feed.caption
      description:  feed.description

    $scope.feed = {}

    # link, source, caption, description
    $scope.fb_feed_dialog = ->
      options = feedOptions($scope.feed)
      if validateFeed($scope.feed)
        $cordovaFacebook.showDialog(options).then (success) ->
          console.log 'success!! :))'
        , (error) ->
          console.log 'error sharing with feed-dialog:', error
      else
        invalidFeedWarning($scope.feed);