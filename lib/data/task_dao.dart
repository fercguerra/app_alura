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
Future <List<Task>> findAll() async {}
Future <List<Task>> find(String nomeDaTarefa) async{}
delete(String nomeDaTarefa) async {}
}