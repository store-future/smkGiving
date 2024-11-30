import sqlite3

# Connect to SQLite database (it will create the file if it doesn't exist)
conn = sqlite3.connect('db.sqlite3')
cursor = conn.cursor()

# Open and execute SQL file
with open('azuredb.sql', 'r') as sql_file:
    cursor.executescript(sql_file.read())

conn.commit()
conn.close()
