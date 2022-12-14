import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'palette.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Webview Demo',
      theme: ThemeData(
        primarySwatch: Palette.shadeBlue,
      ),
      home: const WebViewWrapper(title: 'Flutter Web View'),
    );
  }
}

class WebViewWrapper extends StatelessWidget {
  const WebViewWrapper({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const WebViewPage(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        selectedItemColor: Palette.shadeBlue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Groups',
          ),
        ],
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // Enables virtual display
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://m.facebook.com',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
