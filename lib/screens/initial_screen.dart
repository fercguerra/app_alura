import 'package:flutter/material.dart';
import 'package:app_alura/components/task.dart';
import 'package:app_alura/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: const [
          Task('Aprender Flutter', 'assets/images/dash.png', 3),
          Task('Andar de Bike', 'assets/images/bike.webp', 2),
          Task('Meditar', 'assets/images/meditar.jpeg', 5),
          Task('Ler', 'assets/images/livro.jpg', 4),
          Task(
            'Jogar',
            'assets/images/jogar.jpg',
            1,
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            //empurrar uma nova tela
            context,
            MaterialPageRoute(
              //constrói uma nova tela
              builder: (context) => FormScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    );
  }
}
