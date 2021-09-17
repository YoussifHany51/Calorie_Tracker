import 'package:calorie_tracker/provider/selectedItem.dart';
import 'package:calorie_tracker/welcome/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SelectedItem>(
            create: (context) => SelectedItem(),
          )
        ],
        child: MaterialApp(
          title: 'Calorie Tracker',
          home: Welcome(),
        ));
  }
}
