import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Mahasiswa')),
      body: ListView.builder(
        itemCount: provider.students.length,
        itemBuilder: (context, index)
         {
          return CheckboxListTile(
            title: Text(provider.students[index].name),
            value: provider.students[index].isPresent,
            onChanged: (value) {
              provider.toggleAttendance(index);
              
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: provider.students.isEmpty ? null : provider.saveAttendance,
          child: Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}