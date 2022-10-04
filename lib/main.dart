import 'package:flutter/material.dart';
import 'package:newsapp/sources/pages/tabs_pages.dart';
import 'package:newsapp/sources/services/news_services.dart';
import 'package:newsapp/sources/theme/tema.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mitema,
        title: 'Materia app',
        home: TabsPages()
      ),
    );
  }
}

