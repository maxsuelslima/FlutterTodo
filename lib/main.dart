import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'To-do List', home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  List<String> _tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo list'),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              child:             Form(
                key: _formkey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: taskController,
                        style: TextStyle(fontSize: 32, color: Colors.black87),
                        decoration: InputDecoration(
                            hintText: "type a new task here",
                            hintStyle: TextStyle(fontSize: 20)),
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "taskfield it's required";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        child: Text(
                          "Add",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          final form = _formkey.currentState;
                          if (form != null && form.validate()) {
                            setState(() {
                              _tasks.add(taskController.text);
                            });
                            taskController.clear();
                            return;
                          }
                          ;
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                      ),
                    )
                  ],
                )
                ),
            ),
            Expanded(
              child: ListView.builder(
                
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    
                    child: ListTile(
                      title: Text(_tasks[index]),
                    ),
  
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
