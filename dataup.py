import schedule
import time

def subirdatos():
    datos = 'datos.txt'
    with open(datos) as f_obj:
        lines = f_obj.readlines()

    for line in lines:
        print(line.rstrip())    

schedule.every(2).minutes.do(subirdatos)
#schedule.every().monday.at('12:03').do(subirdatos)

while 1:
    schedule.run_pending()
    time.sleep
