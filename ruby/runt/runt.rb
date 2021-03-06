#!/usr/bin/env ruby

require "webrick"

server = WEBrick::HTTPServer.new(
  :MaxClients => 100,
  :MimeTypes => WEBrick::HTTPUtils::DefaultMimeTypes,
  :DirectoryIndex => ["index.html","index.htm","index.cgi","index.rhtml"],
  :BindAddress => "localhost",
  :Port => 8080,
  :DocumentRoot => File.dirname($0)+"/"+"www/",
  :AccessLog => [] # suppress log messages
                               )

trap("INT") { server.shutdown }

server.start
