//
//Примеры//
class TotalData {
  List<Data> list = [
    Data([
      TaskData("Title1", "Text1", "Low"),
      TaskData("Title2", "Text2", "Medium"),
      TaskData("Title3", "Text3", "High")
    ], "Monday"),
    Data([
      TaskData("Title4", "Text1", "Low"),
      TaskData("Title5", "Text2", "High")
    ], "Tuesday"),
    Data([
      TaskData("Title6", "Text1", "Low"),
      TaskData("Title7", "Text2", "High")
    ], "Friday"),
    Data([
      TaskData("Title8", "Text1", "Medium"),
      TaskData("Title9", "Text2", "Low"),
      TaskData("Title10", "Text3", "Medium"),
    ], "Saturday"),
    Data([
      TaskData("Title11", "Text1", "Medium"),
      TaskData("Title12", "Text2", "Low"),
      TaskData("Title13", "Text3", "Medium"),
      TaskData("Title14", "Text4", "Low"),
      TaskData("Title15", "Text5", "High")
    ], "Sunday"),
  ];
}

class Data {
  String day;
  List<TaskData> taskList;

  Data(this.taskList, this.day);
}

class TaskData {
  double defaultHeight = 78;
  String title;
  String text;
  String type = "Low";

  TaskData(this.title, this.text, this.type);

  TaskData.noType(this.title, this.text);
}
