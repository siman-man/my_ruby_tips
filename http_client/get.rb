require "uri"
require "net/http"

response = Net::HTTP.get_response(URI("http://localhost:9292"))
code = response.code
header = response.header
body = response.body

p code.class
p header.class
p body.class
