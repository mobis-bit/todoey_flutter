import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack, longPressCallBack;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallBack,
      this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: longPressCallBack,
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkboxCallBack,
        ),
      ),
    );
  }
}
