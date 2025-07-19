from flask import jsonify
from app import db
import traceback
from app.models import Category, Element, Rol, User, Credential, UserEntryLog

def CreateRol(data):
    try:
        newrol = Rol(
			name = data['name'],
			description = data['description']
		)
        db.session.add(newrol)
        db.session.commit()
        return jsonify({"Mensaje": "Rol creado correctamente", "id": newrol.role_id}), 201
    except Exception as e:
        print(traceback.format_exc())
        return jsonify({"mensaje":"Error en la base de datos"}), 500

def GetRole():
    try:
        roles = Rol.query.all()
        role_list = []
        
        for rol in roles:
            role_list.append({
                "role_id": rol.role_id,
                "name": rol.name,
                "description": rol.description
            })
        
        return jsonify({
            "status":"ok",
            "length":len(role_list),
            "roles":role_list
        }),200
    except Exception as e:
        print(e)
        print(traceback.format_exc())
        return jsonify({"status":"error",
                        "mensaje":"Error al obtener los roles"})

def DeleteRol(data):
    try:
        role = Rol.query.get(data["id"])
        if not role:
            return jsonify({"status":"error",
                            "message":"error role not found"}),404
        db.session.delete(role)
        db.session.commit()
        return jsonify({"status":"ok",
                        "message":"role delete succesfully"}),200
    except Exception as e:
        print(e)
        print(traceback.format_exc())
        return jsonify({"status":"error",
                        "message": "role has been not deleted"})

