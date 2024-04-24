import 'Database.dart';
import 'Usuarioo.dart';
import 'App.dart';

void main(List<String> args) async {
  await Database().instalacion();
  App.menuInicial();
    
}