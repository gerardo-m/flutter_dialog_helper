import 'package:flutter_dialog_helper/flutter_dialog_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dialog Helper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dialog Helper Demo'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            StaticDialogs(),
            DynamicDialogs(),
          ],
        ),
      ),
    );
  }
}

class StaticDialogs extends StatelessWidget {
  const StaticDialogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                showSuccessMessage(context, 'Success!!!');
              },
              child: const Text('Success Message'),
            ),
            ElevatedButton(
              onPressed: (){
                showErrorMessage(context, 'Error!!!');
              },
              child: const Text('Error Message'),
            ),
          ],
        ),
    );
  }
}

class DynamicDialogs extends StatefulWidget {
  const DynamicDialogs({super.key});

  @override
  State<DynamicDialogs> createState() => _DynamicDialogsState();
}

class _DynamicDialogsState extends State<DynamicDialogs> {

  bool? lastConfirmation;
  String? lastInput;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async{
                bool? confirm = await showConfirmationDialog(context, 'Confirmation', 'Are you sure?');
                setState(() {
                  lastConfirmation = confirm;
                });
              },
              child: const Text('Confirmation Dialog'),
            ),
            Text('Last value confirmation: $lastConfirmation'),
            ElevatedButton(
              onPressed: () async{
                String? input = await showPromtDialog(context, 'Input dialog',);
                setState(() {
                  lastInput = input;
                });
              },
              child: const Text('Prompt Dialog'),
            ),
            Text('Last value prompt: $lastInput'),
          ],
        ),
    );
  }
}