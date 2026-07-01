import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:taskmanager/data/model/api_response.dart';
import 'package:taskmanager/data/model/task_status_model.dart';
import 'package:taskmanager/data/services/api_caller.dart';
import 'package:taskmanager/utils/urls/urls.dart';

class TaskCard extends StatefulWidget {

  final TaskModel taskModel;
  final VoidCallback refreshTaskList;
  final Color statusColor;


  const TaskCard({
    super.key, required this.taskModel, required this.refreshTaskList, required this.statusColor,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
         widget.taskModel.title.toString(),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
              fontSize: 22,
            ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.taskModel.description.toString()),
          const SizedBox(
            height: 8,
          ),
          Text('Created Date: ${widget.taskModel.createdDate}'),
          Row(
            children: [
              Chip(
                label: Text(widget.taskModel.status.toString()),
                backgroundColor: widget.statusColor,
                labelStyle:const TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // Handle edit action
                },
                icon: const Icon(Icons.edit_note,
                    color: Colors.amber),
              ),
              IconButton(
                onPressed: () {
                  deleteTask();
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

// Delete Task 
   Future<void> deleteTask() async {
    final ApiResponse response =
        await ApiCaller.getRequest(url: Urls.deleteTaskURL(widget.taskModel.sId.toString()));

    if (response.isSuccess) {
      widget.refreshTaskList();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task deleted successfully')));
      }
      else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.responseData['data']))));  

    } 
}
}