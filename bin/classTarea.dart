import 'dart:io';

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
  Tarea();

  Tarea.fromMap(ResultRow map) {
    this.titulo = map['titulo'];
   
  }


  Object? get nombre => null;
  
  //Metodo All

    all() async {
    var conn = await Database().conexion();

    try {
      var resultado = await conn.query('SELECT * FROM tareas');
      List<Tarea> tareas =
          resultado.map((row) => Tarea.fromMap(row)).toList();
      return tareas;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

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
  // Método volver menú
  
}
  