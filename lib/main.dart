import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:showcase/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
            actionsIconTheme: IconThemeData(color: Colors.grey.shade700)),
        primarySwatch: Colors.red,
      ),
      home: HomeView(),
    );
  }
}
