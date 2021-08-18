import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_google/constants/colors.dart';

import 'features/notes/presentation/screens/editing_note_screen.dart';
import 'features/notes/presentation/screens/note_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          accentColor: primaryColor,
          iconTheme: IconThemeData(color: iconPrimaryColor),
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            iconTheme: IconThemeData(color: iconPrimaryColor),
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            headline5: TextStyle(color:Colors.grey),
            headline6: TextStyle(color:Colors.grey),
            bodyText1: TextStyle(color:Colors.grey)
          ),
        ),
        home: NoteScreen(),
      ),
    );
  }
}
