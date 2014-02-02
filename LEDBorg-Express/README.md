This code Copyright (c) 2014, Jim Moore - Fotosyn. All rights reserved.

PiBorg is a trading name and LedBorg is a product of Freeburn Robotics Limited,
Raspberry Pi is a trademark of the Raspberry Pi Foundation.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those 
of the authors and should not be interpreted as representing official policies, 
either expressed or implied, of the FreeBSD Project.


#LEDBorg Express

##Introduction

LEDborg Express allows you to control your LEDBorg for Raspberry Pi directly from any network connected desktop computer, mobile device or tablet.

##Getting Started

1. Follow installation instructions at http://www.piborg.com/ledborg/install

2. Open Terminal on Raspberry Pi and find the IP Address of your Raspberry in XXX.XXX.XXX.XXX format. Take a note of this. Type:
>	ifconfig


3. If you are running headless, then simply connect to your Pi using the Terminal app of your choice.

4. On your Raspberry Pi, CD to the directory wher you wish to install the application.

5. In terminal type: 
> sudo wget https://bitbucket.org/fotosyn/fotosynlabs/src/89d19de1a15e7d540606eb3d46853455ecaddb7d/LEDBorg-Express/ledborg-express.zip

6. Unzip this folder. If you don't have zip installed try using - sudo apt-get install zip 
> unzip ledborg-express.zip 

7. Once extracted you'll have anew folder called ledborg-express. To move into this folder type: 
> cd ledborg-express

8. Start the application by typing:
> sudo python ledborg.py

The webserver will start with message 'Running... Serving on port XXXX'

9. Navigate in any web browser on a desktop, smartphone or tablet to the IP address you found earlier. The last four XXXX after the colon is the port number which as default is 8000
> http:XXX.XXX.XXX.XXX:XXXX/console.html

10. Touch or click on the swatches to mix the colours to change the colour of the LEDs on the LEDBorg.

##Create a launch icon

You can add a launch icon to your homescreen on smartphones and tablets. 
Simply select the 'Add to Home Screen' option from the bookmarks menu within the browser. 
An icon should appear on your Home Screen named LEDBorg Express.