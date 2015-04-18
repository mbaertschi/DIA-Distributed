angular.module('app.algorithm').factory 'uploader', [
  '$http'

  ($http) ->

    post: (file) ->
      formData = new FormData
      formData.append('filename', 'croppedImage.png')
      formData.append('file', file)
      formData.append('processType', 'crop')
      formData.append('index', 0)
      $http.post('/upload', formData,
        transformRequest: angular.identity
        headers:
          'Content-Type': undefined
          'X-Requested-With': 'XMLHttpRequest').then (res) ->
            res
]
