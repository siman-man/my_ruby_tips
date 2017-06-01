require 'octokit'

client = Octokit::Client.new(access_token: "token_id")

repo = "siman-man/my-ruby-tips"
base = "master"
head = "sample"
title = "A new PR"
body = "The Body"

client.create_pull_request(repo, base, head, title, body)
