from flask import Flask
app = Flask(__name__)

@app.get("/hello")
def hello():
    return {"message": "hello secure world"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
