from flask import Flask, render_template, request
import flask

app = Flask(__name__)
# Index route
@app.route('/')
def index():
    return render_template('index.html', ip=request.remote_addr)
    # We are telling flask to look for a file named index in the templates folder
    #then render it to the user interface. Note that by default flask looks for templates in a folder named templates.
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

