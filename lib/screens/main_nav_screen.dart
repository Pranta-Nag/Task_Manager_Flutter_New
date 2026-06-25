import 'package:flutter/material.dart';
import 'package:taskmanager/screens/cancled_task_screen.dart';
import 'package:taskmanager/screens/completed_task_screen.dart';
import 'package:taskmanager/screens/new_task_screen.dart';
import 'package:taskmanager/screens/progress_screen.dart';
import 'package:taskmanager/widgets/app_color.dart';
import 'package:taskmanager/widgets/tm_appbar.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int selectedIndex = 0;

  List screens = [
    const NewTaskScreen(),
    const ProgressScreen(),
    const CompletedTaskScreen(),
    const CancledTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TmAppbar(),
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColor.primaryColor,
        indicatorColor: Colors.grey.shade400,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          selectedIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.task), label: 'New task'),
          NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
          NavigationDestination(icon: Icon(Icons.cancel), label: 'Cancled'),
        ],
      ),
    );
  }
}
