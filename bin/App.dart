import 'dart:io';
import 'Usuarioo.dart';
import 'classTarea.dart';

class App {
  static menuInicial(){
    int? opcion;
    do{
      stdout.writeln('''Elige una opción
      1 - Crear usuario
      2 - Log in''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2);
    switch(opcion){
      case 1:
        crearUsuario();
        break;
      case 2:
        login();
        break;
      default:
        print('Opción no válida');
    }
  }
  
   static menuLogueado(Usuario usuario) async {

    int? opcion;
    String? nombre = usuario.nombre;
    do{
      stdout.writeln('''Hola, $nombre, elige una opción:
      1 - Insertar tarea.
      2 - Agenda.
      3 - Eliminar Tarea.
      4 - Volver al menú inicial. ''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4);
    switch(opcion){
      case 1:
        await insertarTarea(usuario);
        break;
      case 2:
        await mostrarTituloTarea(usuario);
        break;
      case 3:
        await Tarea().borrarTarea(usuario);
        break;
      case 4:
        await menuInicial();  
      default:
        print('Opción no válida');
    }
  }
//LOGIN USUARIO
  static login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } else {
       menuLogueado(resultado);
    }
  }
//CREAR USUARIO
 static crearUsuario() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce un nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    usuario.password = usuario.password;
    await usuario.insertarUsuario();
    menuInicial();
  }

  
  static insertarTarea(Usuario usuario)async {
    print("Introduce tu tarea");
    // Crear una nueva tarea
     Tarea tarea = new Tarea();
     tarea.idusuario = usuario.idusuario;
     //Titulo
     stdout.writeln('Introduce el Título de tu Tarea');
     String titulo = stdin.readLineSync() ?? "error";
     tarea.titulo = titulo;
     //Descripción
     stdout.writeln("¿Qué tienes que hacer?");
     String descripcion = stdin.readLineSync()?? "error";
     tarea.descripcion = descripcion;
     //Fecha de creación
     stdout.writeln("¿Qué día empiezas la tarea?");
     String fechaCreacion = stdin.readLineSync() ?? "error";
     tarea.fechaCreacion = fechaCreacion;
     //Fecha de Vencimiento.
     stdout.writeln("¿Cuándo finaliza esta tarea?");
     String fechaVencimiento = stdin.readLineSync() ?? "error";
     tarea.fechaVencimiento = fechaVencimiento;
     //Urge o no Urge
     stdout.writeln("¿Es urgente esta tarea?");
     String urgencia = stdin.readLineSync() ?? "error";
     tarea.urgencia = urgencia;
     await tarea.registarTarea();
     menuLogueado(usuario);
     
    
  }
  

  //Método para ver mis tareas (Agenda).
  static mostrarTituloTarea(usuario) async {
  List<Tarea>? listadoTareas = await Tarea().all();
  if (listadoTareas != null) {
    for (Tarea elemento in listadoTareas) {
      stdout.writeln(elemento.titulo,);
      
    }
      
  } else {
    print("No se pudieron obtener las tareas.");
  }
   menuLogueado(usuario);
}

}
 
