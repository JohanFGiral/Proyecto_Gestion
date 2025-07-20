from flask import Blueprint, render_template
from app import db
from app.models import *
from flask import request
from app.modules.crudrole import *
from app.modules.crudcategory import *

main = Blueprint('main',__name__)

@main.route("/")
def index():
    return render_template("index.html")

@main.route("/createrole", methods = ['POST'])
def crear_rol():
    datos = request.get_json()
    return CreateRol(datos)

@main.route("/getrole", methods = ['GET'])
def get_role():
    return GetRole()

@main.route("/deleterole", methods = ['POST'])
def delete_role():
    data = request.get_json()
    return DeleteRol(data)

@main.route("/updaterole", methods=['POST'])
def update_role():
    data = request.get_json()
    return Updaterole(data)

@main.route('/getcategory',methods=['GET'])
def get_category():
    return GetCategory()

@main.route('/createcategory', methods=['POST'])
def create_category():
    data = request.get_json()
    return CreateCategory(data)

@main.route('/updatecategory', methods=['POST'])
def update_category():
    data = request.get_json()
    return UpdateCategory(data)

@main.route('/deletecategory',methods=['POST'])
def delete_category():
    data = request.get_json()
    return DeleteCategory(data)

@main.route('/check-all')
def check_all():
    from app.models import Category, Element, Rol, User, Credential, UserEntryLog

    try:
        total = {
            "categories": len(Category.query.all()),
            "elements": len(Element.query.all()),
            "roles": len(Rol.query.all()),
            "users": len(User.query.all()),
            "credentials": len(Credential.query.all()),
            "entrylogs": len(UserEntryLog.query.all()),
        }
        return f"Todo conectado correctamente: {total}"
    except Exception as e:
        return f"Error al verificar tablas: {e}"
