import MySQLdb

try:
    db = MySQLdb.connect(
        host="localhost",
        user="root",
        passwd="",
        db="sistema_ventas"
    )
    print("Conexión exitosa")
except MySQLdb.Error as e:
    print(f"Error de conexión: {e}")
