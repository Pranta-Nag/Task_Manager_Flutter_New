import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:taskmanager/widgets/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  late final String title;
  late final int count;

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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const TaskCountByStatus(title: 'New', count: 20);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 15);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "Task ${index}",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Loram operates around the world from 7 regionally located offices in the United States (2), Brazil, the United Kingdom, Finland, Australia and India.'),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Date: 10-10-2026'),
                      Row(
                        children: [
                          Chip(
                            label: Text('New'),
                            backgroundColor: Colors.blue,
                            labelStyle: TextStyle(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit_note, color: Colors.amber),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
