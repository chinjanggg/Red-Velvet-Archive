from flask import Flask
from python.views.index import bp as index_bp
from python.views.createmember import bp as createmember_bp
from python.views.irene import bp as irene_bp


app = Flask(__name__)

app.register_blueprint(index_bp)
app.register_blueprint(createmember_bp)
app.register_blueprint(irene_bp)
