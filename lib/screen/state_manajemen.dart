import 'package:flutter/material.dart';
import 'package:master/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class StateManajemen extends StatefulWidget {
  const StateManajemen({super.key});

  @override
  State<StateManajemen> createState() => _StateManajemenState();
}

class _StateManajemenState extends State<StateManajemen> {
  int nilaiCounter = 0;
  CounterProvider provider = CounterProvider();

  @override
  void didChangeDependencies() {
    provider = Provider.of<CounterProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar State Manajemen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Local State => SetState()'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () {
                      nilaiCounter--;
                      setState(() {});
                    },
                    icon: const Icon(Icons.exposure_minus_1)),
                Container(
                  width: 50,
                  decoration:
                      const BoxDecoration(border: Border(bottom: BorderSide())),
                  child: Text('$nilaiCounter', textAlign: TextAlign.center),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        nilaiCounter++;
                      });
                    },
                    icon: const Icon(Icons.plus_one)),
              ],
            ),
            const Divider(thickness: 10),
            const SizedBox(height: 30),
            const Text('Global State => Provider'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () {
                      provider.kurangkan();
                    },
                    icon: const Icon(Icons.exposure_minus_1)),
                Container(
                  width: 50,
                  decoration:
                      const BoxDecoration(border: Border(bottom: BorderSide())),
                  child: Text('${provider.hasil}', textAlign: TextAlign.center),
                ),
                IconButton(
                    onPressed: () {
                      provider.tambahkan();
                    },
                    icon: const Icon(Icons.plus_one)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
