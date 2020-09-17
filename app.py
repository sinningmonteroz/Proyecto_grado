import serial

com_serial = serial.Serial('/dev/tty.usbmodem641',
                            baudrate=9600,
                            bytesize=8,
                            parity='N',
                            stopbits=1)

com_serial.write(b'G1 X50 Y50\r\n')

respuesta = com_serial.readline()