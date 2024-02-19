import 'package:flutter/material.dart';
import 'package:task_app/bloc/bloc.dart';
import 'package:task_app/wigets/widgets.dart';

class TaskCreationScreen extends StatefulWidget {
  @override
  _TaskCreationScreenState createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  final TaskBloc _taskBloc = TaskBloc();

  @override
  void initState() {
    super.initState();
    _taskBloc.fetchEmployeeNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Task',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Colors.white,
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            StreamBuilder<String>(
              stream: _taskBloc.selectedEmployeeStream,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: _taskBloc.taskNameController,
                  decoration: InputDecoration(
                    labelText: 'Task Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter task name';
                    }
                    return null;
                  },
                );
              },
            ),
            const SizedBox(height: 16.0),
            StreamBuilder<String>(
              stream: _taskBloc.selectedEmployeeStream,
              builder: (context, snapshot) {
                return TextFormField(
                  controller: _taskBloc.taskDescriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Task Description',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            StreamBuilder<List<String>>(
              stream: _taskBloc.employeeNamesStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox(
                    width: 30.0,
                    child: CircularProgressIndicator(),
                  );
                }
                return DropdownButtonFormField<String>(
                  value:
                      snapshot.data!.isNotEmpty ? snapshot.data!.first : null,
                  items: snapshot.data!.map((employeeName) {
                    return DropdownMenuItem<String>(
                      value: employeeName,
                      child: Text(employeeName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _taskBloc.selectedEmployeeSubject.add(value ?? '');
                  },
                  decoration: const InputDecoration(
                    labelText: 'Assign Employee',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onPressed: () {
                // Check if the task name and description are not empty
                if (_taskBloc.taskNameController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text(
                          'Task name cannot be empty.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Task name and description are not empty, proceed to create task
                  _taskBloc.createTask(context);
                }
              },
              text: 'Create Task',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _taskBloc.dispose();
    super.dispose();
  }
}
