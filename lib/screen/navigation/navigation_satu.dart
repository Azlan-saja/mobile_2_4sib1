import 'package:flutter/material.dart';

class NavigationSatu extends StatelessWidget {
  final String namaAnda;

  const NavigationSatu({super.key, required this.namaAnda});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar Kirim Data'),
      ),
      body: Center(
        child: Text(
          'My name is $namaAnda',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            color: Colors.purple.shade900,
          ),
        ),
      ),
    );
  }
}
