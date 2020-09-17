from flask import Flask, render_template, request,redirect, url_for, flash, jsonify
from flask_mysqldb import MySQL
import json

app = Flask(__name__)

#MySQL
app.config['MYSQL_HOST'] = 'bbsozb5kktpg5weimamm-mysql.services.clever-cloud.com'
app.config['MYSQL_USER'] = 'uts9vcds4rsvbtfm'
app.config['MYSQL_PASSWORD'] = 'rzhM7smizDJwGic8EC0l'
app.config['MYSQL_DB'] = 'bbsozb5kktpg5weimamm'

mysql = MySQL(app)

#Settings
app.secret_key = 'SecretKey'

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/login')
def login():
    return render_template("login.html")

@app.route('/reportes')
def reportes():
    cur = mysql.connection.cursor()
    cur.execute('SELECT valor, fecha_hora FROM humedad_relativa ORDER BY id DESC LIMIT 4')
    data = cur.fetchall()
    datas1 = list(data)
    cur.execute('SELECT valor, fecha_hora FROM presion_atmosferica ORDER BY id DESC LIMIT 4')
    data = cur.fetchall()
    datas2 = list(data)
    cur.execute('SELECT valor, fecha_hora FROM temperatura ORDER BY id DESC LIMIT 4')
    data = cur.fetchall()
    datas3 = list(data)
    cur.execute('SELECT valor, fecha_hora FROM pmtwo ORDER BY id DESC LIMIT 4')
    data = cur.fetchall()
    datas4 = list(data)
    cur.execute('SELECT valor, fecha_hora FROM pmten ORDER BY id DESC LIMIT 4')
    data = cur.fetchall()
    datas5 = list(data)
    return render_template("reportes.html", data1=datas1, data2=datas2, data3=datas3, data4=datas4, data5=datas5)

@app.route('/nosotros')
def nosotros():
    return render_template("nosotros.html")

@app.route('/new_user')
def new_user():
    return render_template("add_user.html")

@app.route('/users')
def users():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM usuarios')
    data = cur.fetchall()
    return render_template('users.html', usuarios = data)

@app.route('/humedad_relativa')
def humedad_relativa():
    cur = mysql.connection.cursor()
    cur.execute('SELECT humedad_relativa.id, estaciones.nombre, estaciones.ubicacion, valor, fecha_hora FROM humedad_relativa INNER JOIN estaciones ON humedad_relativa.estacion = estaciones.id')
    data = cur.fetchall()
    return render_template("humedad_relativa.html", datos = data)

@app.route('/presion_atmosferica')
def presion_atmosferica():
    cur = mysql.connection.cursor()
    cur.execute('SELECT presion_atmosferica.id, estaciones.nombre, estaciones.ubicacion, valor, fecha_hora FROM presion_atmosferica INNER JOIN estaciones ON presion_atmosferica.estacion = estaciones.id')
    data = cur.fetchall()
    return render_template("presion_atmosferica.html", datos = data)

@app.route('/temperatura')
def temperatura():
    cur = mysql.connection.cursor()
    cur.execute('SELECT temperatura.id, estaciones.nombre, estaciones.ubicacion, valor, fecha_hora FROM temperatura INNER JOIN estaciones ON temperatura.estacion = estaciones.id')
    data = cur.fetchall()
    return render_template("temperatura.html", datos = data)

@app.route('/pm2')
def pm2():
    cur = mysql.connection.cursor()
    cur.execute('SELECT pmtwo.id, estaciones.nombre, estaciones.ubicacion, valor, fecha_hora FROM pmtwo INNER JOIN estaciones ON pmtwo.estacion = estaciones.id')
    data = cur.fetchall()
    return render_template("pm2.html", datos = data)

@app.route('/pm10')
def pm10():
    cur = mysql.connection.cursor()
    cur.execute('SELECT pmten.id, estaciones.nombre, estaciones.ubicacion, valor, fecha_hora FROM pmten INNER JOIN estaciones ON pmten.estacion = estaciones.id')
    data = cur.fetchall()
    return render_template("pm10.html", datos = data)

@app.route('/logout')
def logout():
    return render_template("index.html")

@app.route('/editar/<id>')
def get_usuario(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM usuarios WHERE id = %s', (id))
    data = cur.fetchall()
    return render_template("edit_user.html", usuario = data[0])

@app.route('/editar_estacion/<id>')
def get_estación(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estaciones WHERE id = %s', (id))
    data = cur.fetchall()
    cur.execute('SELECT * FROM usuarios')
    datas = cur.fetchall()
    datas = list(datas)
    return render_template("edit_estacion.html", estacion = data[0], datos=datas)

@app.route('/eliminar/<string:id>')
def eliminar_usuario(id):
    cur = mysql.connection.cursor()
    cur.execute('DELETE FROM usuarios WHERE id = {0}', format(id))
    mysql.connection.commit()
    flash('Usuario eliminado satisfactoriamente')
    return redirect(url_for('users'))

@app.route('/estaciones')
def estaciones():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estaciones')
    data = cur.fetchall()
    datas = list(data)
    return render_template("estaciones.html", datos=datas)

@app.route('/new_estacion')
def new_estacion():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM usuarios')
    data = cur.fetchall()
    datas = list(data)
    return render_template("add_estacion.html", datos=datas)

@app.route('/mostrar_reporte', methods=['POST'])
def mostrar_reporte():
    if request.method == 'POST':
        estacion = request.form['estacion']
        anio = request.form['anio']
        medidor = request.form['medidor']
        cur = mysql.connection.cursor()
        if medidor == "hm":
            cur.execute('SELECT meses.descripcion, IFNULL(T1.total_mes, 0) total_mes FROM meses LEFT JOIN (SELECT MONTH(fecha_hora) Mes, AVG(valor) total_mes FROM humedad_relativa WHERE estacion = {0} AND fecha_hora LIKE "{1}-%" GROUP BY Mes) T1 ON T1.mes = meses.mes'.format(estacion,anio))
            data = cur.fetchall()
            titulo = "Gráfica humedad relativa"
        if medidor == "pa":
            cur.execute('SELECT meses.descripcion, IFNULL(T1.total_mes, 0) total_mes FROM meses LEFT JOIN (SELECT MONTH(fecha_hora) Mes, AVG(valor) total_mes FROM presion_atmosferica WHERE estacion = {0} AND fecha_hora LIKE "{1}-%" GROUP BY Mes) T1 ON T1.mes = meses.mes'.format(estacion,anio))
            data = cur.fetchall()
            titulo = "Gráfica Presión Atmosférica"
        if medidor == "t":
            cur.execute('SELECT meses.descripcion, IFNULL(T1.total_mes, 0) total_mes FROM meses LEFT JOIN (SELECT MONTH(fecha_hora) Mes, AVG(valor) total_mes FROM temperatura WHERE estacion = {0} AND fecha_hora LIKE "{1}-%" GROUP BY Mes) T1 ON T1.mes = meses.mes'.format(estacion,anio))
            data = cur.fetchall()
            titulo = "Gráfica Temperatura"
        if medidor == "pm2":
            cur.execute('SELECT meses.descripcion, IFNULL(T1.total_mes, 0) total_mes FROM meses LEFT JOIN (SELECT MONTH(fecha_hora) Mes, AVG(valor) total_mes FROM pmtwo WHERE estacion = {0} AND fecha_hora LIKE "{1}-%" GROUP BY Mes) T1 ON T1.mes = meses.mes'.format(estacion,anio))
            data = cur.fetchall()
            titulo = "Gráfica PM2"
        if medidor == "pm10":
            cur.execute('SELECT meses.descripcion, IFNULL(T1.total_mes, 0) total_mes FROM meses LEFT JOIN (SELECT MONTH(fecha_hora) Mes, AVG(valor) total_mes FROM pmten WHERE estacion = {0} AND fecha_hora LIKE "{1}-%" GROUP BY Mes) T1 ON T1.mes = meses.mes'.format(estacion,anio))
            data = cur.fetchall()
            titulo = "Gráfica PM10"
        return render_template("mostrar_reporte.html", datos = data, titulo = titulo)

@app.route('/reporte')
def reporte():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM estaciones')
    data = cur.fetchall()
    datas = list(data)
    return render_template("reporte.html", datos = datas)

@app.route('/add_user', methods=['POST'])
def add_user():
    if request.method == 'POST':
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        identificacion = request.form['identificacion']
        password = request.form['password']
        email = request.form['email']
        celular = request.form['celular']
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO usuarios (nombres, apellidos, identificacion, password, email, celular) VALUES (%s, %s, %s, %s, %s, %s)', 
        (nombres, apellidos, identificacion, password, email, celular))
        mysql.connection.commit()
        flash('Usuario agregado satisfactoriamente')
        return redirect(url_for('users'))

@app.route('/add_estacion', methods=['POST'])
def add_estacion():
    if request.method == 'POST':
        nombre = request.form['nombre']
        ubicacion = request.form['ubicacion']
        descripcion = request.form['descripcion']
        encargado = request.form['encargado']
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO estaciones (nombre, ubicacion, descripcion, encargado) VALUES (%s, %s, %s, %s)', 
        (nombre, ubicacion, descripcion, encargado))
        mysql.connection.commit()
        flash('Estación agregada satisfactoriamente')
        return redirect(url_for('estaciones'))

@app.route('/save/<id>', methods=['POST'])
def save(id):
    if request.method == 'POST':
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        identificacion = request.form['identificacion']
        password = request.form['password']
        email = request.form['email']
        celular = request.form['celular']
        cur = mysql.connection.cursor()
        cur.execute(""" UPDATE usuarios 
            SET nombres=%s, 
                apellidos=%s, 
                identificacion=%s, 
                password=%s, 
                email=%s, 
                celular=%s 
                WHERE id=%s
        """, (nombres, apellidos, identificacion, password, email, celular, id))
        mysql.connection.commit()
        flash('Usuario actualizado satisfactoriamente')
        return redirect(url_for('users'))

@app.route('/guardar/<id>', methods=['POST'])
def guardar(id):
    if request.method == 'POST':
        nombre = request.form['nombre']
        ubicacion = request.form['ubicacion']
        descripcion = request.form['descripcion']
        encargado = request.form['encargado']
        cur = mysql.connection.cursor()
        cur.execute(""" UPDATE estaciones 
            SET nombre=%s, 
                ubicacion=%s, 
                descripcion=%s, 
                encargado=%s, 
                WHERE id=%s
        """, (nombre, ubicacion, descripcion, encargado, id))
        mysql.connection.commit()
        flash('Estacion actualizada satisfactoriamente')
        return redirect(url_for('estaciones'))

@app.route('/comprobar', methods=['POST'])
def comprobar():
    if request.method == 'POST':
        identificacion = request.form['identificacion']
        password = request.form['password']
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM usuarios WHERE identificacion = %s and password = %s', (identificacion, password))
        data = cur.fetchone()
        if data:
            return redirect(url_for('users'))
        else:
            return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)