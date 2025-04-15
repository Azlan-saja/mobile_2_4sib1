import 'package:flutter/material.dart';

class NavigationTiga extends StatelessWidget {
  final int terimaData;

  NavigationTiga({super.key, required this.terimaData});

  final nilai2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar Navigation Tiga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: terimaData.toString(),
              readOnly: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Nilai 1',
                helperText: 'Nilai 1 berasal dari layar sebelumnya.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: nilai2,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Input Nilai 2',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  int hasil = terimaData + int.parse(nilai2.text);
                  String formatHasil = '$terimaData + ${nilai2.text} = $hasil';
                  Navigator.pop(context, formatHasil);
                },
                child: const Text('Hitung & Tutup'))
          ],
        ),
      ),
    );
  }
}
