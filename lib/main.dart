import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List titleToDo = [];
List descriptionToDo = [];

final title = TextEditingController();
final description = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  int currentIndex = 0;

  addItem() {
    setState(() {
      titleToDo.add(title.text);
      descriptionToDo.add(description.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    title.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[];

    final List<Color> colorCode = <Color>[];

    return Scaffold(
        appBar: AppBar(
          title: Text("To-Do List"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Title',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: titleToDo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(titleToDo[index]),
                        subtitle: Text(descriptionToDo[index], maxLines: 3),
                      ),
                    );
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: addItem,
          child: Icon(Icons.add),
          tooltip: 'Press here to add',
        ));
  }
}
