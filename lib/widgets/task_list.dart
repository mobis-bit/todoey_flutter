import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallBack: (bool checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallBack: () {
                task.isDone ? taskData.checkOffTask(task) : null;
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
