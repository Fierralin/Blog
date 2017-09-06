#!/bin/python3
import SimpleHTTPServier
import SocketServer

PORT = 9100

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

httpd = SocketServer.TCPServer(("", PORT), Handler)

print("serving at port", PORT)
httpd.serve_forever()
