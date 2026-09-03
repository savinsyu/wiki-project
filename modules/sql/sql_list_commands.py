from flask import Blueprint, render_template, request, send_file
from io import BytesIO
from fpdf import FPDF
from modules import connect
import os

bp = Blueprint('sql_list_commands', __name__)

# Количество записей на одной странице
PER_PAGE = 10

@bp.route("/sql")
def sql_list_commands():
    # Получаем номер страницы из запроса (по умолчанию 1)
    page = request.args.get('page', 1, type=int)

    conn = connect.get_db_connection()

    # --- ИСПРАВЛЕНИЕ ОШИБКИ SQLITE3.ROW ---
    count_row = conn.execute("SELECT COUNT(*) FROM sql").fetchone()

    # Теперь извлекаем само число из объекта строки под индексом [0]
    if count_row and count_row[0] is not None:
         sql_list_count = int(count_row[0])
    else:
         sql_list_count = 0
    # ---------------------------------------

    # Рассчитываем смещение для пагинации
    offset = (page - 1) * PER_PAGE

    # Получаем записи для текущей страницы
    sql_list = conn.execute(
        "SELECT * FROM sql ORDER BY 1 DESC LIMIT ? OFFSET ?", 
        (PER_PAGE, offset)
    ).fetchall()

    conn.close()

        # Рассчитываем общее количество страниц
    total_pages = (sql_list_count + PER_PAGE - 1) // PER_PAGE

    return render_template(
        "sql/sql_list_commands.html",
                           sql_list=sql_list,
                           sql_list_count=sql_list_count,
                           page=page,
                           total_pages=total_pages,
                           )

@bp.route("/sql/download-pdf")
def sql_download_pdf():
    conn = connect.get_db_connection()
    sql_list = conn.execute(
        "SELECT sql_command, sql_name FROM sql ORDER BY sql_id DESC"
    ).fetchall()
    conn.close()

    pdf = FPDF()
    font_path = "static/fonts/DejaVuSans.ttf"
    use_dejavu = False

    if os.path.exists(font_path):
        try:
            pdf.add_font("DejaVu", "", font_path, uni=True)
            pdf.add_font("DejaVu", "B", font_path, uni=True)
            use_dejavu = True
        except Exception:
            use_dejavu = False

    pdf.add_page()

    # Заголовок
    pdf.set_font("DejaVu" if use_dejavu else "Verdana", "B", size=16)
    pdf.cell(0, 10, "Список SQL команд", ln=True, align="C")
    pdf.ln(5)

    # Заголовки таблицы
    pdf.set_font("DejaVu" if use_dejavu else "Verdana", "B", size=14)
    col_widths = [80, 80]  # пересчитаем под 2 колонки
    headers = ["Описание команды", "Команда"]

    for i, h in enumerate(headers):
        pdf.cell(col_widths[i], 10, h, border=0, align="L", ln=False)
    pdf.ln()

    # Данные
    pdf.set_font("DejaVu" if use_dejavu else "Helvetica", "", size=10)
    # Высота строки для multi_cell
    line_height = 5

    for row in sql_list:
        r_name = str(row[1]) if row[1] is not None else "-"
        r_command = str(row[0]) if row[0] is not None else "-"

        # Для имени можно оставить cell (обычно короткое)
        pdf.multi_cell(col_widths[0], line_height, r_name, border=0, align="L")

        # Для команды используем multi_cell: он автоматически переносит текст
        # ln=0 — не переходить на новую строку сразу, мы сделаем это вручную после пары ячеек
        pdf.multi_cell(col_widths[1], line_height, r_command, border=0, align="L")

        # После вывода пары ячеек переходим на новую строку
        pdf.ln()

    pdf_data = pdf.output()
    buffer = BytesIO(pdf_data)
    buffer.seek(0)

    return send_file(
        buffer,
        as_attachment=True,
        download_name="sql_commands.pdf",
        mimetype="application/pdf",
    )