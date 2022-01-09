/** we use this class to GetHelper to prevent from repeat writing the same function on other servral classes 
 * and make the code more organised
 * like activities,classes,complant,... and more others 
 *  we will get the data using http package
  **/

import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:school_management/screens/parent/main_parent_page.dart';
import 'package:school_management/screens/teacher/main_teacher_page.dart';

class GetHelper {

  static Future getData(
      String dataId, String typeOfData, String inputData) async {
    try {
      final response = await http.post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: {
            "$inputData": dataId,
          });
      if (response.statusCode == 200) { // if every things are right 
        var userData = await json.decode(response.body);
        print(userData);
        return userData;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future sendComplant(
      GlobalKey<FormState> formKey,
      BuildContext context,
      String type,
      String name,
      String number,
      String title,
      String feedback,
      String schoolId) async {
    if (formKey.currentState!.validate()) {
      try {
        var data = {
          'school_id': schoolId,
          'type': type,
          'name': name,
          'number': number,
          'title': title,
          'feedback': feedback
        };
        var response = await post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: json.encode(data),
        );
        if (response.statusCode == 200) { 
          var message = jsonDecode(response.body);
          print(message);

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text('Thanks')),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(message,
                            style: GoogleFonts.antic(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )),
                          Center(
                            child: FlatButton(
                              child: Text("Ok"),
                              color: Colors.blueAccent,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(MainParentPage.routeName);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
      } catch (e) {
        print(e);
      }
    }
  }

  static Future sendTask(GlobalKey<FormState> formKey, BuildContext context,
      String schoolId, String groupId, String subject, String task) async {
    if (formKey.currentState!.validate()) {
      try {
        var data = {
          'school_id': schoolId,
          'group_id': groupId,
          'subject': subject,
          'task': task,
        };
        var response = await post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        );
        if (response.statusCode == 200) {
          var message = jsonDecode(response.body);
          print(message);

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text('Thanks')),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Text(
                            message,
                            style: GoogleFonts.antic(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )),
                          Center(
                            child: FlatButton(
                              child: Text("Ok"),
                              color: Colors.blueAccent,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(MainTeacherPage.routeName);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
