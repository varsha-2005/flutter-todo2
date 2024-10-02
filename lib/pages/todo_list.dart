import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/model/task.dart'; 
import 'package:task_manager/pages/add_task_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Task> tasks = []; 
  

  void addTask(String taskName, String taskDescription, DateTime taskDate) {
    setState(() {
      tasks.add(Task(name: taskName, description: taskDescription, date: taskDate));
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Icon(
              Icons.assignment,
              size: 28,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(width: 8),
            const Text(
              'ToDo List',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    tasks[index].name,
                    style: TextStyle(
                      decoration: tasks[index].isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
                Checkbox(
                  value: tasks[index].isCompleted,
                  onChanged: (bool? value) {
                    toggleTaskCompletion(index);
                  },
                ),
                IconButton(
                  onPressed: () {
                    deleteTask(index);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tasks[index].description),
                Text(DateFormat.yMd().format(tasks[index].date)),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => AddTaskPage(
                  onAddTask: addTask, 
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
