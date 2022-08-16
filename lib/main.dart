import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas'),
        ),
        body: ListView(
          children: [
            const Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            const Task(
                'Andar de Bike',
                'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
                2),
            const Task(
                'Meditar',
                'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                5),
            const Task(
                'Ler',
                'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                4),
            const Task('Jogar',
                'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 1),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.dificuldade >= 1)
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.dificuldade >= 2)
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.dificuldade >= 3)
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.dificuldade >= 4)
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: (widget.dificuldade >= 5)
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });

                            print(nivel);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(Icons.arrow_drop_up),
                              Text(
                                'Level Up',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: LinearProgressIndicator(
                              color: Colors.white,
                              value: (widget.dificuldade > 0)
                                  ? (nivel / widget.dificuldade) / 10
                                  : 1,
                            ),
                            width: 200,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nivel: $nivel',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                LinearProgressIndicator(
                  value: (widget.dificuldade > 0)
                      ? (nivel / widget.dificuldade) / 10
                      : 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
