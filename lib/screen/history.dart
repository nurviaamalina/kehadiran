import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadiran/providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.attendanceHistory.length,
        itemBuilder: (context, index) {
          final record = provider.attendanceHistory[index];
          final date = record['date'] as DateTime;

          return ListTile(
            title: Text('${date.day}-${date.month}-${date.year}'),
            subtitle: Text('Hadir: ${record['presentCount']}, Tidak Hadir: ${record['absentCount']}'),
          );
        },
      ),
    );
  }
}