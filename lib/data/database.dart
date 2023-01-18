import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//criação do método assíncrono database;
//definição do caminho
//caimho usado para definir banco de dados
//caso não exita, criar o bando de dados atyravés de uma tabela;

Future<Database> getDatabase() async {
  //definir um caminho onde o bando de dados será salvo

  final String path =
      join(await getDatabasesPath(), 'task.db'); //busca o caminho perfeito

  return openDatabase(
    path,
    onCreate: (db, version) => {db.execute(tabela)},
    version: 1,
  );
}
