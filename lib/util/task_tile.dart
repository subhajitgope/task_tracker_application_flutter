import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final String taskDescription;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({super.key,
    required this.taskName,
    required this.taskDescription,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
          SlidableAction(onPressed: deleteFunction, icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
            borderRadius:  BorderRadius.circular(12),
        ),
          ],
      ),


    child: Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
    child: Row(
    children: [
    Checkbox(
    value: taskCompleted,
    onChanged: onChanged,
    activeColor: Colors.black,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    taskName,
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
    ),
    Text(taskDescription,style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
    ],
    )
    ],
    ),
    ),
    ),
    );
    }
}
