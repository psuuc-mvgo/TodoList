import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> todolist = [];

  void Tite(item) {
    setState(() {
      todolist.add(item.text);
    });
  }

  var item = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: item,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Tite(item);
                        },
                        child: Text("ADD"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: todolist.length,
                      itemBuilder: (context, index) {
                        return TodoItem(index + 1, todolist[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  TodoItem(this.Gamit, {super.key});

  String Gamit;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(Gamit),
        leading: CircleAvatar(
          child: Text("#"),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          color: Colors.red,
          onPressed: () {},
        ),
      ),
    );
  }
}
