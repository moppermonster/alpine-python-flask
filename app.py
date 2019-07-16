'''
alpine-python-flask default app.py

You can use this file as a starting point for building your own services

Find out more: https://github.com/nielsds/alpine-python-flask
'''

from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/', methods=['GET'])
def default():
	response = "This is the default response for the alpine-python-flask container." 
	return jsonify({'default': response}), 200

if __name__ == '__main__':
	app.run()

