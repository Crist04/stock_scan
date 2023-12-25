import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockl_scan_parser/screens/home.dart';
import 'package:stockl_scan_parser/utils/api.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ScanNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Scan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
