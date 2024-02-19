import 'package:flutter/material.dart';
import 'package:task_app/models/models.dart';
import 'package:task_app/screens/screens.dart';

class TaskListingScreen extends StatefulWidget {
  @override
  _TaskListingScreenState createState() => _TaskListingScreenState();
}

class _TaskListingScreenState extends State<TaskListingScreen> {
  List<Task> _tasks = []; // Initialize an empty list of tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Task List',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: _tasks.isEmpty
          ? Center(
              child: Text(
                'No tasks found',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ) // Show message if no tasks
          : ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10.0),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 10.0),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final Task task = _tasks[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    titleAlignment: ListTileTitleAlignment.top,
                    title: Text(
                      task.name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            'Assigned Employee: ${task.assignedEmployee}',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Remove the task from the list
                        setState(() {
                          _tasks.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task? newTask = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TaskCreationScreen(),
            ),
          );

          // Check if a new task was created
          if (newTask != null) {
            // Add the new task to the list of tasks
            setState(() {
              _tasks.add(newTask);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
