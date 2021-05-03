# libs/modules
import time
import cowsay
from art import *
from datetime import datetime


# owned
__author__ = 'Rich Bocchinfuso'
__copyright__ = 'Copyright 2021, Hello World for DevOps Workshop'
__credits__ = ['Rich Bocchinfuso']

__license__ = 'MIT'
__version__ = '0.1.0'
__maintainer__ = 'Rich Bocchinfuso'
__email__ = 'rbocchinfuso@gmail.com'
__status__ = 'Dev'


if __name__ == "__main__":
    # set message
    message = text2art("Hello World")
    while(True):
        # datetime object containing current date and time
        now = datetime.now()
        print("now =", now)
        # dd/mm/YY H:M:S
        dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
        cowsay.cow(dt_string)
        # print message
        print(message)
        time.sleep(60)
