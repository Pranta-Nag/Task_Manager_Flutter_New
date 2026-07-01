import 'package:flutter/material.dart';
import 'package:taskmanager/data/model/api_response.dart';
import 'package:taskmanager/data/services/api_caller.dart';
import 'package:taskmanager/screens/main_nav_screen.dart';
import 'package:taskmanager/utils/urls/urls.dart';
import 'package:taskmanager/widgets/screen_background.dart';
import 'package:taskmanager/widgets/tm_appbar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TmAppbar(),
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 140),
                Text(
                  'Add New Task',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 6,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      createTask();
                    },
                    child: const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Function to create a new task
  Future<void> createTask() async {
    final ApiResponse response = await ApiCaller.PostRequest(
      url: Urls.createTaskURL,
      body: {
        "title": titleController.text.trim(),
        "description": descriptionController.text.trim(),
        "status": "New"
      },
    );

    if (response.isSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavScreen(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Task Created Successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.responseData['message'] ?? 'Failed to create task',
          ),
        ),
      );
    }
  }
}
