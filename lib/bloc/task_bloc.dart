import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_app/models/models.dart';
import 'package:task_app/services/services.dart';

class TaskBloc {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final BehaviorSubject<String> selectedEmployeeSubject =
      BehaviorSubject<String>();
  final BehaviorSubject<List<String>> employeeNamesSubject =
      BehaviorSubject<List<String>>();

  Stream<String> get selectedEmployeeStream => selectedEmployeeSubject.stream;
  Stream<List<String>> get employeeNamesStream => employeeNamesSubject.stream;

  void fetchEmployeeNames() async {
    try {
      List<String> employeeNames = await ApiService.fetchEmployeeNames();
      employeeNamesSubject.add(employeeNames);
      // Set the default selected employee to the first employee in the list
      if (employeeNames.isNotEmpty) {
        selectedEmployeeSubject.add(employeeNames.first);
      }
    } catch (e) {
      // Handle error fetching employee names
      print('Error fetching employee names: $e');
    }
  }

  void dispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
    selectedEmployeeSubject.close();
    employeeNamesSubject.close();
  }

  void createTask(BuildContext context) {
    Task newTask = Task(
      name: taskNameController.text,
      description: taskDescriptionController.text,
      assignedEmployee: selectedEmployeeSubject.value ?? '',
    );

    // Pass the new task back to the task listing screen
    Navigator.pop(context, newTask);
  }
}
