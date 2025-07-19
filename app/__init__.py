from flask import Flask
from flask_sqlalchemy import SQLAlchemy # Importante para el manejo de la bd con Postgresql

db = SQLAlchemy()

def create_app():
    app = Flask(__name__) # crea una instancia de flask
    
    #Importante para conexion con la db
    app.config['SQLALCHEMY_DATABASE_URI']= 'postgresql://postgres:1234567890@localhost/gestor'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.init_app(app)
    
    from .routes.routes import main
    app.register_blueprint(main) # importa un blueprint desde routes.py y registra las rutas en la app
    
    return app