# Melakukan import mysql connector
import mysql.connector

# Melakukan percobaan koneksi
conn = mysql.connector.connect(
    user = 'amanda',
    password = 'amanda',
    host = 'localhost',
    database = 'KALBE'
)

# Membuat objek cursor sebagai penanda
cursor = conn.cursor()

# Deklarasi SQL Query untuk memasukkan record ke DB (KARYAWAN)
insert_sql = (
    "CREATE TABLE (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME)"
    "VALUES (%s, %s, %s, %s, %s)")
values = ('Joko', 'Dwi', 25, 'M', 50000)

try:
    # Eksekusi SQL Command
    cursor.execute(insert_sql, values)

    # Melakukan perubahan (commit) pada DB
    conn.commit()

except:
    # Roll Back apabila ada issue
    conn.rollback()

# Menutup koneksi
conn.close()