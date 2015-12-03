#! /usr/bin/python

import sys
import BaseHTTPServer
from BaseHTTPServer import BaseHTTPRequestHandler
from time import ctime
import urllib2
import difflib
import json


class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        current_time = ctime()
        print("Received GET request at " + current_time)
        print("IP:  " + self.client_address[0])
        print("File Requested: " + self.path)
        host = self.headers.get('Host')
        print("Host: " + host)
        if self.headers.get('User-Agent'):
            print("User Agent: " + self.headers.get('User-Agent'))
        response_code = 404
        wines = []
        with open("supplier1.json") as supplier:
            wines = json.load(supplier)
        output = ""
        
        path = filter(None, self.path.rsplit("/"))
        print(path)

        if wines:
            if len(path) == 1:
                response_code = 200
                output = json.JSONEncoder().encode(wines)
            else:
                wineID = int(path[1])
                if wineID < len(wines):
                    if len(path) == 2:
                        response_code = 200
                        output = json.JSONEncoder().encode(wines[wineID])
                    else:
                        key = path[2]
                        if key in wines[wineID]:
                            if len(path) == 3:
                                response_code = 200
                                output = json.JSONEncoder().encode(wines[wineID][key])

        self.send_response(response_code)
        self.send_header("Content-type", "text/html")
        self.send_header("X-Clacks-Overhead", "GNU Terry Pratchett")
        self.end_headers()
        if output:
            self.wfile.write(output)
        print (response_code)
        print
        return

    def do_POST(self):
        current_time = ctime()
        content_len = int(self.headers.getheader('content-length'))
        print("Received POST request at " + current_time + "\nwith this data: " + self.rfile.read(content_len))
        print(self.headers)
        response_code = 200
        print response_code
        print
        self.send_response(response_code)
        self.send_header("Content-type", "text/html")
        self.send_header("X-Clacks-Overhead", "GNU Terry Pratchett")
        self.end_headers()
        self.wfile.write('Welcome to the most POSTy website of them all')

    def log_request(self, code=None, size=None):
        print('Request')

    def log_message(self, format, *args):
        print('Message')


ServerClass = BaseHTTPServer.HTTPServer

if sys.argv[1:]:
    port = int(sys.argv[1])
else:
    port = 9000
server_address = ('', port)

MyHandler.protocol_version = "HTTP/1.0"
httpd = ServerClass(server_address, MyHandler)


sa = httpd.socket.getsockname()
print "Serving HTTP on", sa[0], "port", sa[1], "..."
try:
    httpd.serve_forever()
except KeyboardInterrupt:
    print('^C received, shutting down server')
    httpd.socket.close()
