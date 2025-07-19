from . import db

class Category(db.Model):
    __tablename__ = 'category'
    
    category_id = db.Column(db.Integer, primary_key=True, nullable= False)
    ca_name = db.Column(db.String(15))
    description = db.Column(db.String(100))
    
    elements = db.relationship('Element',backref='category',lazy=True)

class Element(db.Model):
    __tablename__ = 'elements'
    
    elements_id = db.Column(db.Integer, primary_key = True, nullable = False)
    ele_serial = db.Column(db.String(50), nullable = False)
    ele_name = db.Column(db.String(50), nullable = False)
    ele_status = db.Column(db.Boolean, nullable = False)
    ele_dateadded = db.Column(db.DateTime, nullable = False)
    ele_amount = db.Column(db.Integer, nullable = False)
    ele_description = db.Column(db.String(100), nullable = False)
    category_id =db.Column(db.Integer, db.ForeignKey('category.category_id'), nullable = False)

class Rol(db.Model):
    __tablename__ = 'roles'
    
    role_id = db.Column(db.Integer, primary_key = True, nullable = False,autoincrement=True)
    name = db.Column(db.String(10), nullable = False)
    description = db.Column(db.String(150), nullable = False)
    
    users = db.relationship('User', backref='role',lazy=True)

class User(db.Model):
    __tablename__= 'users'
    
    user_id = db.Column(db.Integer, primary_key = True, nullable = False)
    name = db.Column(db.String(50), nullable = False)
    email = db.Column(db.String(100))
    status = db.Column(db.Boolean, nullable = False)
    phone_number = db.Column(db.String(15))
    create_date = db.Column(db.DateTime, nullable = False)
    address = db.Column(db.String(25))
    role_id = db.Column(db.Integer, db.ForeignKey('roles.role_id'))
    
    credentials = db.relationship('Credential',uselist=False, backref='user',lazy=True)
    user_entrylog = db.relationship('UserEntryLog', backref='user',lazy=True)

class Credential(db.Model):
    __tablename__= 'credentials'
    
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'),primary_key = True, nullable=False)
    username = db.Column(db.String(10), nullable = False)
    password = db.Column(db.String(100), nullable = False)

class UserEntryLog(db.Model):
    __tablename__='users_entrylog'
    
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'),primary_key = True, nullable=False)
    entrylog_id = db.Column(db.Integer, primary_key = True, nullable= False)
    entrydate = db.Column(db.DateTime, nullable = False)
    description = db.Column(db.String(100), nullable = True)
