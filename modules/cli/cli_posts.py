from flask import Blueprint, render_template, request, send_file
from io import BytesIO
from fpdf import FPDF
from modules import connect
import os

bp = Blueprint("cli_posts", __name__)

PER_PAGE = 10


@bp.route("/cli")
def cli_posts():
    # Получаем номер страницы, по умолчанию 1
    page = request.args.get('page', 1, type=int)

    conn = connect.get_db_connection()

    # --- ИСПРАВЛЕНИЕ ОШИБКИ SQLITE3.ROW ---
    count_row = conn.execute("SELECT COUNT(*) FROM cli").fetchone()

    # Теперь извлекаем само число из объекта строки под индексом [0]
    if count_row and count_row[0] is not None:
        cli_list_count = int(count_row[0])
    else:
        cli_list_count = 0
    # ---------------------------------------

    offset = (page - 1) * PER_PAGE

    cli_list = conn.execute(
        "SELECT * FROM cli ORDER BY cli_id DESC LIMIT ? OFFSET ?",
        (PER_PAGE, offset)
    ).fetchall()

    conn.close()

    # Расчет количества страниц (округление вверх)
    total_pages = (cli_list_count + PER_PAGE - 1) // PER_PAGE

    return render_template(
        "cli/cli_posts.html",
        cli_list=cli_list,
        cli_list_count=cli_list_count,
        page=page,
        total_pages=total_pages,
    )


@bp.route("/cli/download-pdf")
def cli_download_pdf():
    conn = connect.get_db_connection()
    cli_list = conn.execute(
        "SELECT cli_command, cli_name FROM cli ORDER BY cli_id DESC"
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
    pdf.set_font("DejaVu" if use_dejavu else "Helvetica", "B", size=16)
    pdf.cell(0, 10, "Список CLI команд", ln=True, align="C")
    pdf.ln(5)

    # Заголовки таблицы
    pdf.set_font("DejaVu" if use_dejavu else "Helvetica", "B", size=12)
    col_widths = [20, 40, 80, 40, 40]
    headers = ["Имя", "Команда"]

    for i, h in enumerate(headers):
        pdf.cell(col_widths[i], 10, h, border=1, align="C")
    pdf.ln()

    # Данные
    pdf.set_font("DejaVu" if use_dejavu else "Helvetica", "", size=10)
    for row in cli_list:
        r_name = str(row[0]) if row[0] is not None else "-"
        r_command = str(row[1]) if row[1] is not None else "-"
        pdf.cell(col_widths[1], 10, r_name, border=1)
        pdf.cell(col_widths[2], 10, r_command, border=1)
        pdf.ln()

    # --- ИСПРАВЛЕНИЕ ЗДЕСЬ ---
    pdf_data = pdf.output()      # bytes
    buffer = BytesIO(pdf_data)
    buffer.seek(0)
    # -------------------------

    return send_file(
        buffer,
        as_attachment=True,
        download_name="cli_commands.pdf",
        mimetype="application/pdf",
    )

