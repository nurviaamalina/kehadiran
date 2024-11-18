import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceProvider with ChangeNotifier {
  List<Student> students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
    Student(name: 'Nurvi'),
    Student(name: 'Dea'),
    Student(name: 'Fatim'),
    Student(name: 'Ayuk'),
  ];

  List<Map<String, dynamic>> attendanceHistory = [];

  void toggleAttendance(int index) {
    students[index].isPresent = !students[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    int presentCount = students.where((student) => student.isPresent).length;
    int absentCount = students.length - presentCount;

    attendanceHistory.insert(0, {
      'date': DateTime.now(),
      'presentCount': presentCount,
      'absentCount': absentCount,
    });

    // Reset attendance
    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}