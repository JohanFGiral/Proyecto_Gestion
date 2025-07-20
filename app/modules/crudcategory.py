from flask import jsonify
from app import db
import traceback
from app.models import Category, Element, Rol, User, Credential, UserEntryLog

def GetCategory():
    try:
        categories = Category.query.all()
        categories_list = []
        if not categories:
            return jsonify({"status":"error",
							"message":"Categories not found"}),404
        for category in categories:
            categories_list.append({
				"category_id" : category.category_id,
				"ca_name" : category.ca_name,
				"description":category.description
			})
        return jsonify({"status" : "ok",
						"length":len(categories_list),
						"categories" : categories_list}),200
    except Exception as e:
        print(e)
        print(traceback.format_exc())
        return jsonify({"status":"error",
                        "message":"database or server error"}),500

def CreateCategory(data):
    try:
        if not data.get("ca_name") or not data.get("description"):
            return jsonify({"status":"error",
                            "message":"Error not data given"}), 400
        newcategory = Category(
			ca_name = data["ca_name"],
			description = data["description"]
		)
        
        db.session.add(newcategory)
        db.session.commit()
        return jsonify({"status":"ok",
                        "message":"category created",
                        "id":newcategory.category_id}),201
    except Exception as e:
        print(e)
        print(traceback.format_exc())
        return jsonify({"status":"error",
                        "message":"Database or server error"}),500

def UpdateCategory(data):
    try:
        if not data.get("id"):
            return jsonify({"status":"error",
                            "message":"Error not id given"}), 400
        if not data.get("ca_name") and not data.get("description"):
            return jsonify({"status":"error",
                            "message":"Error not data given"}), 400
        
        category = Category.query.get(data["id"])
        
        if not category:
            return jsonify({"status":"error",
                            "message":"Category not found, bad Id"}), 400
        if data.get("ca_name"):
            category.ca_name = data["ca_name"]
        if data.get("description"):
            category.description = data["description"]
        db.session.commit()
        
        return jsonify({"status":"ok",
                        "message":"Category Updated!"}),200
    except Exception as e:
        print(e)
        print(traceback.format_exc())
        return jsonify({"status":"error",
                        "message":"DB or Server internal error"}),500

def DeleteCategory(data):
    try:
        if not data.get("id"):
            return jsonify({"status":"error",
                            "message":"Error not id given"}), 400
        category = Category.query.get(data["id"])
        if not category:
            return jsonify({"status":"error",
                            "message":"Error category not found"}), 400
        db.session.delete(category)
        db.session.commit()
        return jsonify({"status":"ok",
                        "message":"Category Deleted!"}),200
    except Exception as e:
        print(e)
        print(traceback.format_exc())
        return jsonify({"status":"error",
                        "message":"DB or Server internal error"}),500