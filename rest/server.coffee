express     = require 'express'
http        = require 'http'
sysPath     = require 'path'

app = express()

# Root will respond with the REST url structure
app.get '/', (req, res) ->
  records =
    url1:
      name: 'Algorithm 1'
      description: 'Description for algorithm 1'
      url: 'http://localhost:8081/url1'
    url2:
      name: 'Algorithm 2'
      description: 'Description for algorithm 2'
      url: 'http://localhost:8081/url2'
    url3:
      name: 'Algorithm 3'
      description: 'Description for algorithm 3'
      url: 'http://localhost:8081/url3'
    url4:
      name: 'Algorithm 4'
      description: 'Description for algorithm 4'
      url: 'http://localhost:8081/url4'
  res.send records

app.get '/url1', (req, res) ->
  records =
    name: 'Algorithm 1'
    description: 'Description for Url 1'
    url: 'http://localhost:8081/url1'
    methods: [
      get: 'returns this information'
      post: 'use this algorithm'
    ]
    inputOptions:
      option1: 'option1'
      option2: 'option2'
    outputOptions:
      option1: 'option1'
      option2: 'option2'

  res.send records

app.get '/url2', (req, res) ->
  records =
    name: 'Algorithm 2'
    description: 'Description for Url 2'
    url: 'http://localhost:8081/url2'
    methods: [
      get: 'returns this information'
      post: 'use this algorithm'
    ]
    inputOptions:
      option1: 'option1'
      option2: 'option2'
    outputOptions:
      option1: 'option1'
      option2: 'option2'

  res.send records

app.get '/url3', (req, res) ->
  records =
    name: 'Algorithm 3'
    description: 'Description for Url 3'
    url: 'http://localhost:8081/url3'
    methods: [
      get: 'returns this information'
      post: 'use this algorithm'
    ]
    inputOptions:
      option1: 'option1'
      option2: 'option2'
    outputOptions:
      option1: 'option1'
      option2: 'option2'

  res.send records

app.get '/url4', (req, res) ->
  records =
    name: 'Algorithm 4'
    description: 'Description for Url 4'
    url: 'http://localhost:8081/url4'
    methods: [
      get: 'returns this information'
      post: 'use this algorithm'
    ]
    inputOptions:
      option1: 'option1'
      option2: 'option2'
    outputOptions:
      option1: 'option1'
      option2: 'option2'

  res.send records

app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: err
  return

# Wrap express app with node.js server in order to have stuff like server.stop() etc.
server = http.createServer(app)
server.timeout = 2000

server.listen 8081, ->
  console.log 'Server listening on port 8081'
