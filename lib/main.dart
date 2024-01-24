import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:editor_ui_demo/canvas.dart';
import 'package:editor_ui_demo/editor.dart';
import 'package:provider/provider.dart';

import "utils.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, // to force landscape
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [] // to hide Android UI
      );

  runApp(
    ChangeNotifierProvider(
      create: (context) => TextDataList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editor UI Demo',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FrontPage(),
    );
  }
}

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      endDrawer: const EditorPanel(),
      floatingActionButton: Consumer<TextDataList>(
        builder: (mainContext, textData, child) => FloatingActionButton(
          onPressed: () {
            textData.addNewText();
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: const MainEditArea(),
    );
  }
}
