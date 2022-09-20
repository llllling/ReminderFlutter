import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:remainder_flutter/pages/memo_main_view.dart';
import 'package:remainder_flutter/providers/memo_list_provider.dart';
import 'package:remainder_flutter/providers/repeat_cycle_provider.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => MemoListProvider()),
        ChangeNotifierProvider(create: (_) => RepeatCycleProvider()),
      ], child: const MemoMainView()),
    );
  }
}
