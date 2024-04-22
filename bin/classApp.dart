import 'dart:io';
import 'Usuarioo.dart';
import 'classTarea.dart';
class App {
  menuInicial(){
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

  menuLogueado(Usuario usuario) async {
    int? opcion;
    String? nombre = usuario.nombre;
    do{
      stdout.writeln('''Hola, $nombre, elige una opción
      1 - Listar usuarios.
      2 - Insertar tarea.
      3 - Listar tarea.
      4 - Salir''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion != 1 && opcion !=2 && opcion !=3);
    switch(opcion){
      case 1:
        await listarUsuarios();
        menuLogueado(usuario);
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

  login() async {
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

  crearUsuario() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce un nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    usuario.password = usuario.password;
    await usuario.insertarUsuario();
    menuInicial();
  }

  listarUsuarios()async{
    List<Usuario> listadoUsuarios = await Usuario().all();
    for(Usuario elemento in listadoUsuarios){
      stdout.writeln(elemento.nombre);
    }
  }
  
  insertarTarea() {
    print("Introduce tu tarea");
    String? respuesta = stdin.readLineSync();
  }
  
  listarTarea() async{
    List<Tarea> listadoTareas = await Tarea().all();
    for(Tarea elemento in listadoTareas){
      stdout.writeln(elemento.nombre);
    }

  }


 
  
  
    
  
 

  }
  
 
