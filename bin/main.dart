import 'Database.dart';
import 'Usuarioo.dart';
import 'App.dart';

void main(List<String> args) {
  Database().instalacion();

  var classApp;
  App.menuInicial();

Usuario usuario = new Usuario();
  App.menuLogueado();
  
}