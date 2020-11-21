import 'dart:convert';
import 'package:Notes_App/Pages/AddTodoPage.dart';
import 'package:Notes_App/Pages/Prayers_Page.dart';
import 'package:Notes_App/Pages/profile_page.dart';
import 'package:Notes_App/models/Todo.dart';
import 'package:Notes_App/widgets/todo_Item_Widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _todosKey = "todos";

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  List<Todo> _listTodo = [];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPreferences) {
      var stringJson = sharedPreferences.getString(_todosKey);
      if(stringJson != null){
        List<dynamic> list = json.decode(stringJson);
        setState(() {
          _listTodo = list.map((e) => Todo.fromJson(e, json)).toList();
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(224, 124, 124, 1.0),
            actions: [
              IconButton(
                onPressed: (){
                  _goToAddPage();
                },
                icon: Icon(Icons.add),
              )
            ],
            centerTitle: true,
            title: Text("Notas"),
            bottom: TabBar(
              isScrollable: true,

              indicator: BoxDecoration(
                color: Color.fromRGBO(224, 105, 124, 1.0),
              ),
              tabs: [
                Tab(icon: Icon(Icons.library_books),),
                Tab(icon: Icon(Icons.folder_open),),
                Tab(icon: Icon(Icons.account_circle),)
              ],
            ),
          ),
          body: TabBarView(
            children: [

              ListView.builder(
                  itemCount: _listTodo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoItemWidget(
                      todoItem: _listTodo[index],
                      onDelete: () {
                        _confirmDelete(index);
                      },
                      onEdit: () {
                        _editTodo(index, _listTodo[index]);
                      },
                    );
                  }),
              PrayersPage(),
              ProfilePage()
            ],
          ),
        ),
      ),
    );
  }

  void _goToAddPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AddTodoPage()))
        .then((todoItem) {
      if (todoItem != null) {
        setState(() {
          _listTodo.add(todoItem);
        });
      }
      _saveInSharedPreferences(_listTodo);
    });
  }

  void _confirmDelete(int index) {
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Eliminar"),
              content: Text("¿Estas Seguro que deseas eliminar la Nota?"),
              actions: [
                FlatButton(onPressed: () {
                  Navigator.pop(context);
                },
                  child: Text("Cancelar"),
                ),
                FlatButton(onPressed: () {
                  _deleteTodo(index);
                },
                  child: Text("Aceptar"),
                )
              ],
            )
    );
  }

  void _deleteTodo(index) {
    setState(() {
      _listTodo.removeAt(index);
      _saveInSharedPreferences(_listTodo);
    });
    Navigator.pop(context);
  }

  void _editTodo(int index, Todo todo) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) =>
            AddTodoPage(
              todo: todo,
            )))
        .then((todoItem) {
      if (todoItem != null) {
        setState(() {
          _listTodo[index] = todoItem;
        });
      }
    });
  }

  void _saveInSharedPreferences(List<Todo> listTodo) {
    var list = listTodo.map((e) => e.toJson()).toList();
    var stringJson = json.encode(list);
    SharedPreferences.getInstance().then((sharedPreferences) => {
      sharedPreferences.setString(_todosKey, stringJson)
    });
  }
}

