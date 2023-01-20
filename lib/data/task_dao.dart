import 'package:app_alura/data/database.dart';

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

  save(Task tarefa) async {}
  Future<List<Task>> findAll() async {
    print('Estamos acessando o findAll: ');
    final Database dancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);

    //objetos do tipo mapa
    print('Procurando dados no Banco de dados... encontrado: &result');
    return toList(result); //lista de objetos
  }

  List<Task> toList(List<Map<String, dynamic>> MapadeTarefas) {
    print('Convertendo to List');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> Linha in MapadeTarefas) //verificar cada linha
    {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);

      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }
}

Future<List<Task>> find(String nomeDaTarefa) async {}
delete(String nomeDaTarefa) async {}
