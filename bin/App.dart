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
      1 - Listar usuarios.
      2 - Insertar tarea.
      3 - Listar tarea.
      4 - Salir''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2 && opcion !=3  && opcion !=4);
    switch(opcion){
      case 1:
        await listarUsuarios();
        break;
      case 2:
        await insertarTarea();
        break;
      case 3:
        await listarTarea();
        break;
      case 4:
        print("Adios");
        break;
      default:
        print('Opción no válida');
    }
  }

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

  static listarUsuarios()async{
    List<Usuario> listadoUsuarios = await Usuario().all();
    for(Usuario elemento in listadoUsuarios){
      stdout.writeln(elemento.nombre);
    }
  }
  
  static insertarTarea() {
    print("Introduce tu tarea");
    // Crear una nueva tarea
     Tarea tarea = new Tarea();
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
  
     
    String? respuesta = stdin.readLineSync();
  }
  

  //Método para listar tareas.
  static listarTarea() async{

    List<Tarea> listadoTareas = await Tarea().all();
    for(Tarea elemento in listadoTareas){
      stdout.writeln(elemento.nombre);
    }

  }


 
  
  
    
  
 

  }
  
 
