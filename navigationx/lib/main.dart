import 'package:flutter/material.dart';
import 'package:navigationx/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/second': (context) => const SecondPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Main Page'),
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
  String textToSecond = '';
  String textFromSecond = 'Here comes from Second......';

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
            Text('Write something to Second Page',
                style: Theme.of(context).textTheme.headlineSmall),
            TextField(
              onChanged: (value) {
                textToSecond = value;
              },
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text('Text from Second Page',
                style: Theme.of(context).textTheme.headlineSmall),
            Text(
              textFromSecond,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          awaitResultFromSecond(context);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  void awaitResultFromSecond(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context, '/second',
      arguments: textToSecond);

    setState(() {
      textFromSecond = result?.toString() ?? 'No data form Second';
    });
  }
}
