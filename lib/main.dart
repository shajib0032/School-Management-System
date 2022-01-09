import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/problem.dart';
import 'package:school_management/registration.dart';

import 'provider/parent.dart';
import 'provider/student.dart';
import 'provider/teacher.dart';

import 'screens/login_page.dart';
import 'screens/parent/main_parent_page.dart';
import 'screens/teacher/main_teacher_page.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( // The providers that we are gonna use at the app
      providers: [
        ChangeNotifierProvider(
          create: (context) => Parent(),   // parentProvier
        ),

           ChangeNotifierProvider(
          create: (context) => Student(),  // studentparentProvier
        ),

              ChangeNotifierProvider(
          create: (context) => Teacher(),  // teacherProvier
        ),
      ],
      child: MaterialApp(
        title: 'App Name',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.transparent,
        ),
        //home: Login(), // homepage
        // home: Registration(),
        initialRoute: '/',
        routes: { // route names to mainParentPage and mainTeacherPage
          Registration.routeName:(ctx)=>Registration(),
          MainParentPage.routeName: (ctx) => MainParentPage(),
          Login.routeName: (ctx) => Login(),
          MainTeacherPage.routeName: (ctx) => MainTeacherPage(),
         //Problem.routeName:(ctx)=>Problem()
        },
      ),
    );
  }
}
