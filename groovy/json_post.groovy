def baseUrl = new URL('https://httpbin.org/post')
def queryString = 'id=1&name=Test&job=sklad'
def connection = baseUrl.openConnection()
connection.with {
  doOutput = true
  requestMethod = 'POST'
  outputStream.withWriter { writer ->
    writer << queryString
  }
  println content.text
}


def post = new URL ("https://httpbin.org/post").openConnection()
def body = '{"name":"Test"}'
post.setRequestMethod("POST")
post.setRequestProperty("Content-Type","application/json")
post.setDoOutput(true)
post.getOutputStream().write(body.getBytes("UTF-8"))
def postRC = post.getResponseCode()
println(postRC)
println(post.getInputStream().getText())