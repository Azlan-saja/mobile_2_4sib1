import 'package:flutter/material.dart';
import 'package:master/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return Center(
      child: Text(
        'Layar Home\n ${provider.hasil}',
        textAlign: TextAlign.center,
      ),
    );
  }
}
