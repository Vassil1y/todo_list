import 'package:flutter/material.dart';
import 'day.dart';
import 'data.dart';

TotalData totalData = TotalData();

class ListHome extends StatefulWidget {
  const ListHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ListHomeState createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {


  void refer(TaskData k){
    setState(() {
      for(var j in totalData.list){
        j.taskList.remove(k);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    String taskTitle = "/None/";
    String taskText = "";




    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        body: Container(
            color: Colors.pinkAccent.withOpacity(0.1),
            child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("This week"),
                  Flexible(
                      fit: FlexFit.loose,
                      child:SizedBox(
                          child:ListView.builder(
                              itemCount: totalData.list.length,
                              itemBuilder: (context, index1){
                                return Day(
                                  data: totalData.list,
                                  dayIndex: index1,
                                  notifyParent: refer,
                                );
                              },
                          )
                      )
                  )
                ]
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                      ),
                      title: const Text("Создание задачи"),
                      content: Column(
                        children: [
                          Row(
                            children: [
                              TextButton(onPressed: (){}, child: const Text("High")),
                              TextButton(onPressed: (){}, child: const Text("Medium")),
                              TextButton(onPressed: (){}, child: const Text("Low"))
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextField(
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Short text (Title)'
                                ),
                                onChanged: (text) {
                                  taskTitle = text;
                                },
                                onSubmitted: (text) {
                                  taskTitle = text;
                                },
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Common text'
                              ),
                              minLines: 5,
                              maxLines: 100,
                              onChanged: (text) {
                                taskText = text;
                              },
                              onSubmitted: (text) {
                                taskText = text;
                              },
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: const Text("No")),
                        TextButton(
                            onPressed: (){
                              setState(() {
                                totalData.list[0].taskList.add(TaskData(taskTitle, taskText, "Low"));
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yea"))
                      ],
                    )
            );
            // Add your onPressed code here!
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        )
    );
  }
}