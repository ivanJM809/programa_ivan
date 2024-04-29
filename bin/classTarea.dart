import 'package:mysql1/mysql1.dart';
import 'Database.dart';

class Tarea{
  //Propiedades de la clase.
  int? idTarea;
  String? titulo;
  String? descripcion;
  String? fechaCreacion;
  String? fechaVencimiento;
  String? urgencia;
  

  //Contructores de la clase tarea.
  

  Object? get nombre => null;

  all() {}

  //Método insertar tarea
    registarTarea() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO tareas (idTarea,titulo) VALUES (?,?)',
          [idTarea,titulo]);
      print('Tarea creada correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}

  