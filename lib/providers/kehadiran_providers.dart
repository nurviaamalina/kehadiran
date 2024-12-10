import 'package:flutter/material.dart';

class KehadiranProvider with ChangeNotifier {
  // Daftar siswa beserta status kehadiran awal (default: semua tidak hadir)
  List<Map<String, dynamic>> students = [
    {'name': 'Dea', 'isPresent': false},
    {'name': 'Ayu', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
    {'name': 'Nurvi', 'isPresent': false},
    {'name': 'Fatim', 'isPresent': false},
  ];

  // Riwayat kehadiran
  List<Map<String, dynamic>> attendanceHistory = [];

  /// Menyimpan data kehadiran saat ini ke dalam riwayat
  void saveAttendance() {
    // Siswa yang hadir
    final presentStudents =
        students.where((s) => s['isPresent']).map((s) => s['name']).toList();

    // Siswa yang tidak hadir
    final absentStudents =
        students.where((s) => !s['isPresent']).map((s) => s['name']).toList();

    // Menyimpan data kehadiran ke riwayat
    attendanceHistory.insert(0, {
      'date': DateTime.now(),
      'present': presentStudents,
      'absent': absentStudents,
    });

    // Mengatur ulang status kehadiran semua siswa menjadi false
    for (var student in students) {
      student['isPresent'] = false;
    }

    // Memberi tahu listener bahwa ada perubahan
    notifyListeners();
  }

  void toggleAttendance(int index) {}
}
