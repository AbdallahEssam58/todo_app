import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/tabs/settings.dart';
import 'package:todo_app/tabs/tasks.dart';

import 'add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "ToDo",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding:EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskBottomSheet(),
              );
            },
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          iconSize: 30,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [TasksTabs(), SettingsTab()];
}
