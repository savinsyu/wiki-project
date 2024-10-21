*Почитать версию на английском: [English](readme.md)*

# Генерация файла установки компонентов
## Генерация файла
```
python -m pip freeze > requirements.txt
```
## Установка компонентов из файла
```
pip install -r requirements.txt
```
# Создание таблиц
```
CREATE TABLE
  IF NOT EXISTS tasks (
    id_task INTEGER PRIMARY KEY AUTOINCREMENT,
    datetime_task datetime default CURRENT_TIMESTAMP,
    title_task TEXT NOT NULL,
    content TEXT NOT NULL,
    status_task BOOLEAN
  )

CREATE TABLE
  IF NOT EXISTS posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL
  )
  
create table sandbox
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content  text
);  
  
  
  CREATE TABLE
  IF NOT EXISTS git_and_bash (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    command TEXT NOT NULL,
    name TEXT NOT NULL
  )
```
# Создание маршрутов
Для создания страницы ссылка на нее прописывается в базовом шаблоне или навигационной панели
Вот пример ссылки:
```
<a class="nav-link" href="{{ url_for('sql') }}"> SQL </a>
```
В самом скрипте приложения, в нашем случае git app.py, мы прописываем маршрут к странице.
```
@app.route('/sql')
def sql():
    return render_template('sql.html')
```
Где 1-я строка - это сам маршрут, 2-я строка - объявление функции, а 3-я строка - выходные данные страницы из шаблонов.
Саму страницу можно просто скопировать с index.html, чтобы изменить содержимое.
```
{% extends "base.html" %}
{% block title %}Home Page{% endblock %}
{% block content %}
<p>Главная</p>
{% endblock %}
```
# Загрузка изображений
HTML страница.
```
<title>Python Flask File Upload Example</title>
<h2>Select a file to upload</h4>
<p>
	{% with messages = get_flashed_messages() %}
	  {% if messages %}
		<ul class=flashes>
		{% for message in messages %}
		  <li>{{ message }}</li>
		{% endfor %}
		</ul>
	  {% endif %}
	{% endwith %}
</p>
<form method="post" action="/" enctype="multipart/form-data">
    <dl>
		<p>
			<input type="file" name="file" autocomplete="off" required>
		</p>
    </dl>
    <p>
		<input type="submit" value="Submit">
	</p>
</form>
```
# Логика приложения.
Самое главное - правильно указать папку, в которую будут сохранены файлы
```
UPLOAD_FOLDER = 'static'
# расширения файлов, которые разрешено загружать
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__)
# конфигурируем
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
bootstrap = Bootstrap5()
app.secret_key = "secret key"

@app.route('/upload_images')
def upload_images():
    return render_template("upload_images.html")

@app.route('/', methods=['POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        file = request.files['file']
        if file.filename == '':
            flash('No file selected for uploading')
            return redirect(request.url)
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            flash('File successfully uploaded')
            return redirect('/')
        else:
            flash('Allowed file types are txt, pdf, png, jpg, jpeg, gif, py, docx')
            return redirect(request.url)
```
# Свои стили 
Чтобы подключить ваш css-файл, вам нужно написать следующий код в base.html
```
<link href="{{ url_for('static', filename='styles.css') }}" rel="stylesheet">
```
# Раскрывающееся меню
```
<li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
    aria-expanded="false">
    Сервисы
  </a>
  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
    <li><a class="dropdown-item" href="{{ url_for('dump') }}">Дамп базы данных</a></li>
    <li><a class="dropdown-item" href="{{ url_for('xlsx') }}">Выгрузка таблиц баз данных в ексель</a></li>
  </ul>
</li>
```
# Страница 404
Часто бывает, что пользователь случайно неправильно указывает ссылку в адресной строке. Для того, чтобы ошибка отображалась корректно, вам необходимо зарегистрировать страницу 404.
```
@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404
```
404.html
```
{% extends "base.html" %}
{% block title %}Page Not Found{% endblock %}
{% block content %}
  <h1>Page Not Found</h1>
  <p>What you were looking for is just not there.
  <p><a href="{{ url_for('index') }}">go somewhere nice</a>
{% endblock %}
```
# Создание дампа базы данных
Создание дампа базы данных dump.py
```
import sqlite3
import io

conn = sqlite3.connect('database.db')

# Open() function
with io.open('database_dump.sql', 'w') as p:
    # iterdump() function
    for line in conn.iterdump():
        p.write('%s\n' % line)
print(' Backup performed successfully!')
print(' Data Saved as backupdatabase_dump.sql')
conn.close()
```
В bash или cmd рабочего каталога проекта напишите команду:
```
python dump.py
```
После этого в рабочем каталоге создается дамп базы данных.

# Работы с портами
Если требуется работать с разными проектами на локальной машине, то нужно указать разные порты:
http://127.0.0.1:82
http://127.0.0.1:81
Указывается порт в этой строке файла приложения:
if name == "main":
app.run(debug=True, host='0.0.0.0', port=81)

# Bash скрипты
Ниже описанные скрипты приведены как пример, нужно обязательно учитывать размещение каталогов в системе
## Создание дампа базы данных
```
venv/scripts/python.exe dump.py
```

## Копируем скрипты sql в папку sql-scripts из рабочего пространства dbeaver
```
cp ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases/work/Scripts/Flask.sql /p/s.savin/flask_project/sql-scripts
```

## Запускаем приложение
```
venv/scripts/python.exe app.py
```

## Приложение открывается в браузере по умолчанию
```
venv/scripts/python.exe -m webbrowser http://127.0.0.1:82
```

## Создания и отправки коммита
```
set text= "Reserve Copy: %date%   %time% "
git add .
git commit -m %text%
git push
```

## Копируем конфигурацию DBeaver
```
cp -r ~/dbeaver-ce-24.0.4-win32.win32.x86_64/dbeaver/bases* /p/s.savin/Work/
```

## Последовательный запуск двух скриптов Bash
```
./dump_database.sh && ./commit.sh
```