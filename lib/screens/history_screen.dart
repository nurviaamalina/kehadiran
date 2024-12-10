import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/kehadiran_providers.dart';
import 'detail_kehadiran_screen.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Kehadiran'),
      ),
      body: provider.attendanceHistory.isEmpty
          ? const Center(
              child: Text(
                'Tidak ada riwayat kehadiran.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: provider.attendanceHistory.length,
              itemBuilder: (ctx, index) {
                final history = provider.attendanceHistory[index];

                // Validasi data kehadiran
                final presentStudents =
                    (history['present'] as List<dynamic>? ?? [])
                        .map((e) => e.toString())
                        .toList();
                final absentStudents =
                    (history['absent'] as List<dynamic>? ?? [])
                        .map((e) => e.toString())
                        .toList();
                final presentCount = presentStudents.length;
                final absentCount = absentStudents.length;

                // Validasi dan format tanggal
                final rawDate = history['date'];
                String formattedDate;
                if (rawDate is DateTime) {
                  formattedDate =
                      DateFormat('d MMMM yyyy, HH:mm').format(rawDate);
                } else {
                  formattedDate = 'Tanggal tidak tersedia';
                }

                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tanggal
                        Text(
                          'Tanggal: $formattedDate',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),

                        // Jumlah hadir dan tidak hadir
                        Text(
                          'Hadir ($presentCount) | Tidak Hadir ($absentCount)',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),

                        // Tombol navigasi ke halaman detail
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailKehadiranScreen(
                                  presentStudents: presentStudents,
                                  absentStudents: absentStudents,
                                ),
                              ),
                            );
                          },
                          child: const Text('Lihat Detail Kehadiran'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
