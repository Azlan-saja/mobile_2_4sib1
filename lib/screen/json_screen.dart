import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({super.key});

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  final jamController = TextEditingController();
  final pejalaranController = TextEditingController();
  List<Map<String, dynamic>> roster = [];
  bool isUpdate = false;
  int idUpdate = 0;

  void readRoster() async {
    String respon = await rootBundle.loadString('assets/roster.json');
    roster = List<Map<String, dynamic>>.from(jsonDecode(respon));
    setState(() {});
  }

  void createRoster() {
    roster.add({
      "id": roster.isNotEmpty ? roster.last['id'] + 1 : 1,
      "jam": jamController.text,
      "pelajaran": pejalaranController.text,
    });
    setState(() {});
  }

  void updateRoster() {
    setState(() {
      isUpdate = false;
      idUpdate = 0;
      for (var rst in roster) {
        if (rst['id'] == idUpdate) {
          rst['jam'] = jamController.text;
          rst['pelajaran'] = pejalaranController.text;
          break;
        }
      }
    });
  }

  void deleteRoster({required int id}) {
    roster.removeWhere((rst) => rst['id'] == id);
    setState(() {});
  }

  @override
  void initState() {
    readRoster();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar Read File JSON'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextFormField(
              controller: jamController,
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then(
                  (value) {
                    if (value != null) {
                      if (!context.mounted) return;
                      jamController.text = value.format(context);
                    }
                  },
                );
              },
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Jam Masuk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: pejalaranController,
              decoration: const InputDecoration(
                labelText: 'Mata Pelajaran',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => isUpdate ? updateRoster() : createRoster(),
                    child: const Text('Simpan')),
                ElevatedButton(onPressed: () {}, child: const Text('Batal')),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: roster.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(roster[index]["pelajaran"]),
                    subtitle: Text(roster[index]["jam"]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            isUpdate = true;
                            idUpdate = roster[index]["id"];
                            jamController.text = roster[index]["jam"];
                            pejalaranController.text =
                                roster[index]["pelajaran"];
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () => deleteRoster(id: roster[index]["id"]),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
