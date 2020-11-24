import sqlite3

connection = sqlite3.connect('database.db')


with open('yatvapp_ddl.sql') as f:
    connection.executescript(f.read())

connection.commit()
connection.close()


