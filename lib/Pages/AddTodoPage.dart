import 'package:Notes_App/models/Todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  @override

  final Todo todo;

  AddTodoPage({this.todo});

  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String _titleError;
  String _noteError;
  String _titleAppbar = "";
  @override
  void initState() {
    super.initState();
    if(widget.todo != null){
      _titleController.text = widget.todo.title;
      _noteController.text = widget.todo.note;
    }
  }


  @override
  void dispose() {
    _titleController.clear();
    _noteController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(224, 124, 124, 1.0),
          title: Text("Notas"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only( left: 20.0, right: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _titleController,
                    autocorrect: true,
                    autofocus: true,
                    decoration:
                        InputDecoration(errorText: _titleError, labelText: "Titulo",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(224, 124, 124, 1.0),)
                          )
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: TextField(
                    controller: _noteController,
                    decoration:
                        InputDecoration(errorText: _noteError, labelText: "Nota",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(224, 124, 124, 1.0),)
                          )
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          _cancelSave();
                        },
                        color: Color.fromRGBO(224, 124, 124, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Text(
                          "Cancelar",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _validateFields();
                        },
                        color: Color.fromRGBO(224, 124, 124, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Text(
                          "Guardar",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateFields() {
    var hasError = false;
    if (_titleController.text.trim().isEmpty) {
      hasError = true;
      setState(() {
        _titleError = "Coloca un titulo";
      });
    }
    if (_noteController.text.trim().isEmpty) {
      hasError = true;
      setState(() {
        _noteError = "Coloca una nota";
      });
    }
    if (!hasError) {
      _safeTodo();
    }
  }

  void _safeTodo() {
    var todo = Todo(
        title: _titleController.text,
        note: _noteController.text
    );
    Navigator.of(context).pop(todo);
  }

  void _cancelSave() {
    Navigator.pop(context);
  }
}
