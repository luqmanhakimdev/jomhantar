from flask import Flask
app = Flask(__name__)

@app.route('/')
def page():
    return 'JomHantar'


if __name__ == "__main__":
    app.run(debug=True)