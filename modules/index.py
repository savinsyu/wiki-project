from flask import Blueprint, render_template

# Имя 'index' должно быть уникальным во всем приложении
index_bp = Blueprint('index', __name__)

@index_bp.route('/')
def home():
    return render_template('index.html')