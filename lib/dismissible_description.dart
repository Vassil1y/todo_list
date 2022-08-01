import 'package:flutter/material.dart';
import 'task.dart';

import 'package:todo_list/data.dart';

// ignore: must_be_immutable
class DismTask extends StatefulWidget {
  DismTask({Key? key, required this.task, required this.taskList, required this.notifyParent}) : super(key: key);

  TaskData task;
  List<TaskData> taskList;
  final Function(TaskData k) notifyParent;

  @override
  _DismTaskState createState() => _DismTaskState();
}

class _DismTaskState extends State<DismTask> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),

        background: Container(
          color: Colors.red,
        ),
        secondaryBackground: Container(
          color: Colors.green,
        ),
        onDismissed: (direction){
          // Разделение на Удалить/Выполнить, но в данном случае не имеет разницы, тк оно в любом случае удаляется из списка))
          // if(direction == DismissDirection.startToEnd) {
          //   //left - right
          // }
          // else {
          //   //right - left
          // }
          // Так что просто удаляем
          widget.notifyParent(widget.task);
        },

        child: SizedBox(
            width: double.infinity,
            child:Task(task: widget.task))
    );
  }
}
