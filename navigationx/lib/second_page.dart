import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String textFromCaller = '';
  String textToCaller = '';
  @override
  Widget build(BuildContext context) {
    textFromCaller = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Column(
        children: [
          const Text('Tekst from caller'),
          Text(textFromCaller),
          const Text('Tekst to caller'),
          TextField(
            onChanged: (value) {
              textToCaller = value;
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {Navigator.pop(context, textToCaller)},
          child: const Icon(Icons.arrow_back)),
    );
  }
}
