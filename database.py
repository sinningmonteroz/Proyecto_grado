import pymysql
import schedule
import time

estacion=1

class DataBase:
    def __init__(self):
        self.connection = pymysql.connect(
            host='localhost',
            user='root',
            password='',
            db='proyecto_grado'
        )

        self.cursor = self.connection.cursor()

        print("Conexión establecida exitosamente")

    def select_user(self, id):
        sql = 'SELECT * FROM usuarios WHERE id={}'.format(id)

        try:
            self.cursor.execute(sql)
            user = self.cursor.fetchone()
            print("Id: ", user[0])
            print("Nombre: ", user[1])
            print("Apellidos: ", user[2])

        except Exception as e:
            raise

    def insert_humedadrelativa(self):
        datos = 'datos.txt'
        with open(datos) as f_obj:
            lines = f_obj.readlines()
        
        sql = "INSERT INTO humedad_relativa (estacion, valor) VALUES ('{}', '{}')".format(estacion, lines[0])
        sql2 = "INSERT INTO temperatura (estacion, valor) VALUES ('{}', '{}')".format(estacion, lines[1])
        sql3 = "INSERT INTO presion_atmosferica (estacion, valor) VALUES ('{}', '{}')".format(estacion, lines[2])
        sql4 = "INSERT INTO pmtwo (estacion, valor) VALUES ('{}', '{}')".format(estacion, lines[3])
        sql5 = "INSERT INTO pmten (estacion, valor) VALUES ('{}', '{}')".format(estacion, lines[4])

        try:
            self.cursor.execute(sql)
            self.cursor.execute(sql2)
            self.cursor.execute(sql3)
            self.cursor.execute(sql4)
            self.cursor.execute(sql5)
            self.connection.commit()

            print("Insercción de datos exitosa! ")
        except Exception as e:
            raise

def calldb():
    database = DataBase()
    database.insert_humedadrelativa()


schedule.every(10).seconds.do(calldb)

while 1:
    schedule.run_pending()
    time.sleep
