import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management/Ui/DashBoard.dart';
import 'package:task_management/Ui/SplashScreen.dart';
import 'package:task_management/utills/toolsHelper.dart';

import 'Ui/HomePage.dart';
import 'Ui/HomeScreen.dart';
import 'api/DatabaseHelper.dart';


late ToolsHelper toolsHelper;
late DatabaseHelper dbHelper;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    toolsHelper = ToolsHelper.withData(context);
      dbHelper = DatabaseHelper.instance;

    return MaterialApp(
          debugShowCheckedModeBanner: false,
         home:  Splashscreen(),
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            //  visualDensity: VisualDensity.comfortable,
            fontFamily:'MainFont',
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Colors.white),
            textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.cyan))
               )
          ),
        );
  }
}

