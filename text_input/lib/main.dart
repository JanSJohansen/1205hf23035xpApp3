import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController text1Controller = TextEditingController();
  String text2string = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Indtast noget',
            ),
            TextField(
              controller: text1Controller,
              decoration:
                  const InputDecoration(hintText: 'Skriv noget her.....'),
            ),
            TextButton(
              child: const Text('Tryk her'),
              onPressed: () => {print(text1Controller.text)},
            ),
            Text(
              'Skriv noget andet her....',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextField(onChanged: (value) {
              setState((){
                text2string = value;
              });               
            }),
            Text(text2string),
          ],
        ),
      ),
    );
  }
}
