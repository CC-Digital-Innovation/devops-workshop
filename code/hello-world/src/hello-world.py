#!/usr/bin/env python3

# libs/modules
import time
import cowsay
import logging
from art import *
from datetime import datetime
from flask import Flask

# owned
__author__ = 'Rich Bocchinfuso'
__copyright__ = 'Copyright 2021, Hello World for DevOps Workshop'
__credits__ = ['Rich Bocchinfuso']

__license__ = 'MIT'
__version__ = '0.1.0'
__maintainer__ = 'Rich Bocchinfuso'
__email__ = 'rbocchinfuso@gmail.com'
__status__ = 'Dev'


app = Flask(__name__)

@app.route('/')
def hello():
    app.logger.info(dt_string)
    app.logger.info(message)
    return ("<h1 style=\"font-size:10vw\">" + message + "</h1>")

if __name__ == "__main__":
    # read message from message.txt file
    with open('message.txt', 'r') as f:
        message = f.read()
    # datetime object containing current date and time
        now = datetime.now()
        # dd/mm/YY H:M:S
        dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
        # let the cow give us a data and time stamp
        cowsay.cow(dt_string)
        # format message for console output
        console_message = text2art(message)
        print(console_message)
    # start hello-world app
    app.run(port=5000, debug=True, threaded=True, host=('0.0.0.0'))
