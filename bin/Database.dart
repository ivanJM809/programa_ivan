import 'package:mysql1/mysql1.dart';

class Database {
  // Propiedades
  final String _host = 'localhost';
  final int _port = 3306;
  final String _user = 'root';

  // Métodos
  instalacion() async {
    var settings = ConnectionSettings(
      host: this._host, 
      port: this._port,
      user: this._user,
    );
    var conn = await MySqlConnection.connect(settings);
    try{
      await _crearDB(conn);
      await _crearTablaTareas(conn);
      await conn.close();
    } catch(e){
      print(e);
      await conn.close();
    } 
  }

  Future<MySqlConnection> conexion() async {
    var settings = ConnectionSettings(
      host: this._host, 
      port: this._port,
      user: this._user,
      db: 'tareasdb'
    );
      
    return await MySqlConnection.connect(settings);
 
  }
  
  _crearDB (conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS tareasdb');
    await conn.query('USE tareasdb');
    print('Conectado a tareasdb');
  }
  }

  //Método crear tabla tareas
  _crearTablaTareas(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS tareas(
      idTarea INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      idusuario INT,
      titulo VARCHAR(15) NOT NULL,
      descripcion VARCHAR(250),
      fechaCreacion VARCHAR(10),
      fechaVencimiento VARCHAR(10),
      urgencia VARCHAR(20)
      

      

    ) ''');
    print("Tabla de tareas creada");
  }

