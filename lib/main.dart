import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('<<Interactive Risk Communication Game>>'),
        ],
           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), 
           // 既存のテキスト
          SizedBox(height: 20), // スペースを追加
          Text('双方向的リスクコミュニケーションゲーム'), // ランダムな英単語
        
          Text(appState.current.asLowerCase),
          

          // **最初のボタン**
          ElevatedButton(
            onPressed: () {
              appState.addText('最初のボタンが押されました！');
            },
            child: Text('最初のボタン'),
          ),
        ],
      );
  }
}