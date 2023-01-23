import 'package:app_alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao {
  static String tableSQL = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static String _tablename = 'taskTable';
  static String _difficulty = 'dificuldade';
  static String _name = 'nome';
  static String _image = 'imagem';

  save(Task tarefa) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExisists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExisists.isEmpty) {
      print('A tarefa não existia. ');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa já existia!');
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de Tarefas:  $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
      );
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas: ${tarefas.toString()}');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    print('Procurando tarefa com o nome: ${nomeDaTarefa}');
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final Database bandoDeDados = await getDatabase();
    return bandoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
