import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/pages/memo_main_view.dart';
import 'package:remainder_flutter/providers/memo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MemoProvider(),
        child: const MemoMainView(),
      ),
    );
  }
}