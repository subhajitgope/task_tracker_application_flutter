import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_tracker_application_flutter/data/database.dart';
import 'package:task_tracker_application_flutter/util/task_tile.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox=Hive.box('mybox');

  //text controller
  final _controller=TextEditingController();
  final _controller1=TextEditingController();

  ToDoDataBase db=ToDoDataBase();

  @override
  void initState(){
    //todo implement initstate

    //if this is the first time even open the app then create the default data
if(_myBox.get("TODOLIST") == null){
  db.createInitialData();
}else{
  //there already exists data
  db.loadData();
}

    super.initState();
  }
/*//list of todo tasks
  List toDoList = [
    ["make", "at 5pm", false],
    ["make", "at 4pm", false],

  ];*/

//checkbox was tapped
  void checkBoxChanged(bool? value,int index) {
//index means which task
  //when
  setState(() {
db.toDoList[index][2]=!db.toDoList[index][2];
  });
  db.updateDataBase();
  }
  void saveNewTask(){

    setState(() {
      if(_controller.text.isNotEmpty && _controller1.text.isNotEmpty)
      db.toDoList.add([_controller.text,_controller1.text,false]);
      _controller.clear();
      _controller1.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  void cancelTheTask(){
    setState(() {
      Navigator.of(context).pop();
      _controller.clear();
      _controller1.clear();
    });

    db.updateDataBase();
  }
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        controller1: _controller1,
        onSave: saveNewTask,
        onCancel: cancelTheTask,
      );
    },);
  }
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200], //default colour
      appBar: AppBar(title: const Text("Task Tracker",),
        elevation: 0,
        backgroundColor: Colors.yellow,
        centerTitle: true,),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add,size: 30,),
      ),
      body: ListView.builder(
        itemCount:db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(taskName: db.toDoList[index][0],
              taskDescription: db.toDoList[index][1],
              taskCompleted: db.toDoList[index][2],
              onChanged
              : (value) => checkBoxChanged(value,index),
          deleteFunction: (context) => deleteTask(index),);
        },

      ),
    );
  }
}
