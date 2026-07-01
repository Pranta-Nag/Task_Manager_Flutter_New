import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taskmanager/data/model/api_response.dart';
import 'package:taskmanager/data/model/task_status_count.dart';
import 'package:taskmanager/data/model/task_status_model.dart';
import 'package:taskmanager/data/services/api_caller.dart';
import 'package:taskmanager/screens/add_new_task_screen.dart';
import 'package:taskmanager/utils/urls/urls.dart';
import 'package:taskmanager/widgets/task_card.dart';
import 'package:taskmanager/widgets/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  // late final String title;
  // late final int count;

  @override
  void initState() {
    super.initState();
    getAllTaskCount();
    getAllTaskStatus();
  }

// Function to get all task counts by status
  List<TaskStatusCount> taskCount = [];

  Future<void> getAllTaskCount() async {
    final ApiResponse response =
        await ApiCaller.getRequest(url: Urls.getTaskCountURL);

    List<TaskStatusCount> taskC = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in (response.responseData['data'])) {
        taskC.add(TaskStatusCount.fromJson(jsonData));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.responseData['data']))));
    }

    setState(() {
      taskCount = taskC;
    });
  }

// Function to get all tasks with status "New"
  List<TaskModel> tasks = [];

  Future<void> getAllTaskStatus() async {
    final ApiResponse response =
        await ApiCaller.getRequest(url: Urls.getTaskStatusURL('New'));

    List<TaskModel> task = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in (response.responseData['data'])) {
        task.add(TaskModel.fromJson(jsonData));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(jsonDecode(response.responseData['data']))));
    }

    setState(() {
      tasks = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: taskCount.length,
                itemBuilder: (context, index) {
                  final Tcount = taskCount[index];
                  return TaskCountByStatus(
                    title: Tcount.sId.toString(),
                    count: Tcount.sum!.toInt(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 15);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskCard(taskModel: task, statusColor: Colors.blue, refreshTaskList: () async {
                  await  getAllTaskCount();
                   await getAllTaskStatus();
                  },);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


