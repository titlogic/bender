template = (name, response) ->

  """
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <title>#{name} Help</title>
  <style type="text/css">
    body {
      background: #000000;
      color: #636c75;
      text-shadow: 0 1px 1px rgba(255, 255, 255, .5);
      font-family: Helvetica, Arial, sans-serif;
    }
  </style>
  </head>
  <body>
    <h1>Hi, I am #{name}</h1>
    <div class="commands">
      #{response}
    </div>
  </body>
</html>
  """

module.exports = (robot) ->
  robot.router.get "/", (req, res) ->
    response  = "<img src='https://upload.wikimedia.org/wikipedia/en/a/a6/Bender_Rodriguez.png'>"
    res.setHeader 'content-type', 'text/html'
    res.end template(robot.name, response)
