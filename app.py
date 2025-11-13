from flask import Flask
app = Flask(__name__)

@app.get("/hello")
def hello():
    return {"message": "hello secure world"}

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8000)
