import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noteapp/Db/note_functions.dart';
import 'package:noteapp/Db/note_model.dart';
import 'package:noteapp/Screens/all_note_screen.dart';

import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
  ]);
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(NoteModelAdapter().typeId)) {
    Hive.registerAdapter(NoteModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteFunctions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        theme: ThemeData(
          primaryColor: Colors.grey,
        ),
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Center(
              child: Image.asset(
                'assets/images/notes.png',
                height: 150,
              ),
            ),
            animationDuration: const Duration(milliseconds: 500),
            nextScreen: const AllNotesScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: MyTheme.backgroundColor),
      ),
    );
  }
}
