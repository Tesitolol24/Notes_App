import 'package:Notes_App/models/Todo.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {

  @required final Todo todoItem;
  @required final VoidCallback onDelete;
  @required final VoidCallback onEdit;

  TodoItemWidget({this.todoItem, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Card(
        color: Color.fromRGBO(247, 244, 139, 1.0),
        child: ListTile(
          title: Text(todoItem.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
          subtitle: Text(todoItem.note,),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete, color: Colors.redAccent,),
          ),
        ),
      ),
    );
  }
}
