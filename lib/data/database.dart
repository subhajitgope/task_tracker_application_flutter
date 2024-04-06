import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList=[];
  //reference our box
  final _myBox=Hive.box('mybox');

  //run this method if this is the first time ever opening the app
void createInitialData(){
  toDoList=[
    ["Breakfast","at 9am",false],
    ["Office","at 10am",false],
    ["Mail Check","at 10:15am",false],
    ["Meeting","at 11;30am",false],
    ["Lunch","at 1pm",false],
    ["Talk to Manager","at 2:30pm",false],

  ];
}
//load the data from database
void loadData(){
toDoList=_myBox.get("TODOLIST");
}
//update the database
  void updateDataBase(){

_myBox.put("TODOLIST", toDoList);
  }

}