import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/data.dart';
import 'package:todo_list/list/list_of_days/task_itself/dismissible_description.dart';

// ignore: must_be_immutable
class Day extends StatefulWidget {
  Day(
      {Key? key,
      required this.data,
      required this.notifyParent,
      required this.dayIndex})
      : super(key: key) {
    date = DateTime.now();
    dateFormat = DateFormat('EEEE').format(date);
    today = data[dayIndex].day;
    if (dateFormat == data[dayIndex].day) {
      forTodayColor = Colors.pinkAccent.withOpacity(0.2);
      today += " / Today!";
    }

    for (var k in data[dayIndex].taskList) {
      switch (k.type) {
        case "High":
          taskHigh.add(k);
          break;
        case "Medium":
          taskMedium.add(k);
          break;
        case "Low":
          taskLow.add(k);
      }
    }
    orderedData = taskHigh + taskMedium + taskLow;

    height = heightCounter();
  }

  @override
  _DayState createState() => _DayState();

  final Function(TaskData) notifyParent;

  double height = 0;

  late final List<Data> data;
  List<TaskData> taskHigh = [];
  List<TaskData> taskMedium = [];
  List<TaskData> taskLow = [];
  List<TaskData> orderedData = [];

  final int dayIndex;

  DateTime date = DateTime.now();
  String dateFormat = "";

  Color forTodayColor = Colors.pinkAccent.withOpacity(0.1);
  String today = "";

  double heightCounter() {
    double height = 0;
    for (var k in orderedData) {
      height += k.defaultHeight;
    }
    return height;
  }
}

class _DayState extends State<Day> {
  void refer(TaskData k) {
    setState(() {
      widget.orderedData.remove(k);
      widget.height = widget.heightCounter();
      Future.delayed(const Duration(milliseconds: 250), () {
        widget.notifyParent(k);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.forTodayColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: Text(widget.today,
                  style: const TextStyle(
                      color: Colors.indigo,
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          Flexible(
            fit: FlexFit.loose,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: widget.height,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.orderedData.length,
                itemBuilder: (context, index2) {
                  return DismTask(
                    task: widget.orderedData[index2],
                    taskList: widget.orderedData,
                    notifyParent: refer,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
