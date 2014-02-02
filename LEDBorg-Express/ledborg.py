#!/usr/bin/env python
#
#  ledborg.py
#  ledBorgSwitcher
#
#  Created by James Moore on 22/05/2013.
#  Copyright (c) 2013 Fotosyn. All rights reserved.
#
#  PiBorg is a trading name and LedBorg is a product of Freeburn Robotics Limited,
#  Raspberry Pi is a trademark of the Raspberry Pi Foundation.

#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:

#  1. Redistributions of source code must retain the above copyright notice, this
#  list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright notice,
#  this list of conditions and the following disclaimer in the documentation
#  and/or other materials provided with the distribution.>

#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
#  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#  The views and conclusions contained in the software and documentation are those
#  of the authors and should not be interpreted as representing official policies,
#  either expressed or implied, of the FreeBSD Project.

# This script sets up and runs an HTTP server to receive requests from the iOS App.

import SimpleHTTPServer, SocketServer
import urlparse

PORT = 8000 # CHange this if you wish to listen on a different port

class LedBorgHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):

    def do_GET(self):

        # Parse query data
        parsedParams = urlparse.urlparse(self.path)
        queryParsed = urlparse.parse_qs(parsedParams.query)

        # Add 'ledborg' prefix to URL to perform query
        if parsedParams.path == "/ledborg":

            red = queryParsed['red'][0]
            green = queryParsed['green'][0]
            blue = queryParsed['blue'][0]

            colour = str(red) + str(green) + str(blue) # Concatenate the 3 values

            LedBorg = open('/dev/ledborg', 'w')
            LedBorg.write(str(colour))  # Write the colour string to the LedBorg device
            LedBorg.close()

            self.processRequest(queryParsed)
        else:
            # Default to serve up a local file
            SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self);

    def processRequest(self, query):

        self.send_response(200)


httpd = SocketServer.TCPServer(("", PORT), LedBorgHandler)

print "Running... Serving on port", PORT
httpd.serve_forever()
