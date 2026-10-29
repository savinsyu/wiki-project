from flask import Blueprint, redirect, url_for, render_template, request, flash
from modules import connect

categories_bp = Blueprint('categories', __name__)


@categories_bp.route("/categories")
def list_categories():
    conn = connect.get_db_connection()
    cursor = conn.cursor()

    # Получаем категории и считаем количество постов в каждой из них
    cursor.execute("""
        SELECT 
            c.id_category, 
            c.category_name,
            COUNT(p.id_post) as posts_count
        FROM post_categories c
        LEFT JOIN posts p ON c.id_category = p.post_category_id
        GROUP BY c.id_category, c.category_name
        ORDER BY c.id_category DESC
    """)
    categories_list = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("categories/categories.html", categories_list=categories_list)


@categories_bp.route("/categories/add", methods=["GET", "POST"])
def add_category():
    if request.method == "POST":
        cat_name = request.form["category_name"].strip()

        if len(cat_name) >= 2:
            conn = connect.get_db_connection()
            cursor = conn.cursor()
            try:
                cursor.execute("INSERT INTO post_categories (category_name) VALUES (%s)", (cat_name,))
                conn.commit()
                flash('Категория успешно добавлена!', category='success')
                return redirect(url_for("categories.list_categories"))
            except Exception as e:
                flash('Ошибка: возможно, такая категория уже существует.', category='danger')
            finally:
                cursor.close()
                conn.close()
        else:
            flash('Название категории должно быть длиннее 2 символов!', category='danger')

    return render_template("categories/add_category.html")


@categories_bp.route("/categories/edit/<int:id_category>", methods=["GET", "POST"])
def edit_category(id_category):
    conn = connect.get_db_connection()
    cursor = conn.cursor()

    if request.method == "POST":
        cat_name = request.form["category_name"].strip()

        if len(cat_name) >= 2:
            cursor.execute(
                "UPDATE post_categories SET category_name = %s WHERE id_category = %s",
                (cat_name, id_category)
            )
            conn.commit()
            cursor.close()
            conn.close()
            flash('Категория успешно обновлена!', category='success')
            return redirect(url_for("categories.list_categories"))
        else:
            flash('Название слишком короткое!', category='danger')

    cursor.execute("SELECT * FROM post_categories WHERE id_category = %s", (id_category,))
    category_view = cursor.fetchone()
    cursor.close()
    conn.close()

    return render_template("categories/edit_category.html", category_view=category_view)


@categories_bp.route("/categories/delete/<int:id_category>", methods=["POST"])
def delete_category(id_category):
    conn = connect.get_db_connection()
    cursor = conn.cursor()

    # Проверяем, есть ли посты в этой категории перед удалением
    cursor.execute("SELECT COUNT(*) FROM posts WHERE post_category_id = %s", (id_category,))
    count_row = cursor.fetchone()
    posts_in_cat = int(list(count_row.values())[0]) if isinstance(count_row, dict) else int(count_row[0])

    if posts_in_cat > 0:
        flash(f'Нельзя удалить категорию! К ней привязано постов: {posts_in_cat}. Сначала переназначьте их.',
              category='danger')
    else:
        cursor.execute("DELETE FROM post_categories WHERE id_category = %s", (id_category,))
        conn.commit()
        flash('Категория успешно удалена!', category='success')

    cursor.close()
    conn.close()
    return redirect(url_for("categories.list_categories"))
