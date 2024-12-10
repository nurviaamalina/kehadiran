import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/kehadiran_providers.dart';

class KehadiranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
    String formattedDate = DateFormat('d MMMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Siswa'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hari: $dayOfWeek',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tanggal: $formattedDate',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (ctx, index) {
                final student = provider.students[index];
                return ListTile(
                  title: Text(student['name']),
                  trailing: Checkbox(
                    value: student['isPresent'],
                    onChanged: (value) {
                      student['isPresent'] = value!;
                      provider.notifyListeners();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hari: $dayOfWeek',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: provider.students.any((s) => s['isPresent'])
                      ? provider.saveAttendance
                      : null,
                  child: Text('Simpan Kehadiran'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
