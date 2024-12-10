import 'package:flutter/material.dart';

class DetailKehadiranScreen extends StatelessWidget {
  final List<String> presentStudents;
  final List<String> absentStudents;

  DetailKehadiranScreen({
    required this.presentStudents,
    required this.absentStudents,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Kehadiran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Siswa yang Hadir:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ...presentStudents.isNotEmpty
                ? presentStudents
                    .map((student) => Text(student,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 17, 19, 17))))
                    .toList()
                : [const Text('Tidak ada siswa hadir')],
            const SizedBox(height: 20),
            const Text(
              'Siswa yang Tidak Hadir:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ...absentStudents.isNotEmpty
                ? absentStudents
                    .map((student) => Text(student,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 10, 9, 9))))
                    .toList()
                : [const Text('Semua siswa hadir')],
          ],
        ),
      ),
    );
  }
}
