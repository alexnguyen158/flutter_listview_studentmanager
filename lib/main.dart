import 'package:flutter/material.dart';
import 'package:flutter_buoi06_baitap01/model/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ListView Student Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listStudents = new List<Student>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      var student = new Student((i + 1).toString(),
          'Name ' + (i + 1).toString(), '20', 'Class ' + (i + 1).toString());
      listStudents.add(student);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: listStudents.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Text('Index: ' + listStudents[index].index),
                        Spacer(),
                      ]),
                      Row(children: [
                        Text('Name: ' + listStudents[index].fullName),
                        Spacer(),
                      ]),
                      Row(children: [
                        Text('Age: ' + listStudents[index].age),
                        Spacer(),
                      ]),
                      Row(children: [
                        Text('Class: ' + listStudents[index].className),
                        Spacer(),
                        Icon(Icons.delete),
                      ]),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStudent,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addStudent() {
    setState(() {
      int i = listStudents.length;
      var student = new Student((i + 1).toString(),
          'Name ' + (i + 1).toString(), '20', 'Class ' + (i + 1).toString());
      listStudents.add(student);
    });
  }


}
