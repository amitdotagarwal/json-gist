#!/usr/bin/env ruby
require 'json'
require 'net/http'
result = nil
uri = URI('http://letsrevolutionizetesting.com/challenge.json')
puts uri
while result == nil
  res = Net::HTTP.get_response(uri)
  challenge = JSON.parse(res.body)
  if challenge.has_key?("follow")
    uri = URI(challenge["follow"].sub("challenge?", "challenge.json?"))
  else
    result = challenge
  end
end
puts result