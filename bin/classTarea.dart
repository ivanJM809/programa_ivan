import 'dart:io';

import 'package:mysql1/mysql1.dart';
import 'Database.dart';
import 'Usuarioo.dart';
import 'App.dart';

class Tarea{
  //Propiedades de la clase.
  int? idTarea;
  int? idusuario;
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

  //Método registrar tarea
    registarTarea() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO tareas (idusuario,titulo) VALUES (?,?)',
          [idusuario,titulo]);
      print('Tarea creada correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
  // Metodo borra tarea
  borrarTarea(Usuario usuario) async {
    var conn = await Database().conexion();
    try {
      List<Tarea> listadoTareas = await all();
      for(Tarea tarea in listadoTareas){
        stdout.writeln('Estas son tus tareas que tienes pendientes: ${tarea.titulo}');
      }
      stdout.writeln("¿Qué tarea quieres eliminar?");
      var opcion = stdin.readLineSync() ?? "e";
      bool encontrado = false;
      for(Tarea tarea in listadoTareas){
        if(tarea.titulo == opcion){
          await conn.query("DELETE FROM tareas WHERE titulo = ?", [opcion]);
          stdout.writeln("Tarea borrada");
          encontrado = true;
          break;
        }
      }
      if(encontrado == false ) {
        throw ("No se ha encontrado ninguna tarea");
      }
    }catch(e){
      print(e);
      App.menuLogueado;
    } finally {
      await conn.close();
    }

  }
  
}
  