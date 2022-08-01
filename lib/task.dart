import 'package:flutter/material.dart';
import 'package:todo_list/data.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {

  Task({Key? key, required this.task}) : super(key: key){
    switch (task.type) {
      case "High":
        shadeColor = Colors.red.shade300;
        break;
      case "Medium":
        shadeColor = Colors.orange.shade300;
        break;
      case "Low":
        shadeColor = Colors.blue.shade300;
        break;
    }
  }
  TaskData task;
  Color shadeColor = Colors.grey.shade500;

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TotalData outData = TotalData();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 20 ),
            child:  LongPressDraggable(
                feedback: Container(
                  color: Colors.black,
                  height: 120,
                  width: 200,

                ),
                child:Container(
                    padding: const EdgeInsets.all(2),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: widget.shadeColor,
                            spreadRadius: 1.0,
                            blurRadius: 8.0,
                            offset: const Offset(3.0, 3.0))
                      ],
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                margin: const EdgeInsets.only(left: 10, top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Text(
                                  // task.title,
                                  widget.task.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: "Inter"
                                  ),
                                ),
                              ),

                              Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(left: 10,bottom: 3),
                                  decoration: BoxDecoration(
                                      color: Colors.pink.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child:Text(
                                    widget.task.type,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: "OpenSans",

                                    ),
                                  )
                              )
                            ]),
                        Row(
                          children: [
                            IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.create)),
                            IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.delete))
                          ],
                        )
                      ],
                    )
                )
        )
    );
  }
}
