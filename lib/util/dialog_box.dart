import 'package:flutter/material.dart';
import 'package:task_tracker_application_flutter/util/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  final controller1;

  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.controller1,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 230,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Task Name"),
              ),
              SizedBox(height: 12,),
              TextFormField(controller: controller1,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Task Description"),
              ),
              SizedBox(height: 8,),
              //button save+cancel
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  MyButton(text: "Save", onPressed: onSave),

                  SizedBox(width: 8,),
                  //cancel button
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
