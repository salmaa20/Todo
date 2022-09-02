import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_sat/firebase_options.dart';
import 'package:todo_c6_sat/home/edit_task/edit_task_screen.dart';
import 'package:todo_c6_sat/home/home_screen.dart';
import 'package:todo_c6_sat/my_theme.dart';
import 'package:todo_c6_sat/provider/app_provider.dart';
import 'package:todo_c6_sat/provider/tasks_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (_) => TasksProvider(),),
    ChangeNotifierProvider(create: (_) => AppProvider()),
  ],
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  late AppProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        EditTaskScreen.routeName: (_) => EditTaskScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
  }

