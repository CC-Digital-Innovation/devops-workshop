# libs/modules
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

@app.route("/")
def hello():
    # set message
    message=("Hello World!\n")
    return (message)

if __name__ == "__main__":
    app.run(port=5000, threaded=True, host=('0.0.0.0'))
