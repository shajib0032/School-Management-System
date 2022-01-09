/**the provider for parent */

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/screens/parent/main_parent_page.dart';


//ParentClass
class ParentInf  {

  final String? id;
  final String? schoolID;
  final String? studentID;
  final String? name;
  final String? email;
  final String? address;
  final String? number;
  final String? dateOfRegister;
  final String? password;

  ParentInf({ this.id, this.schoolID, this.studentID, this.name, this.email, this.address, this.number, this.dateOfRegister, this.password });

}

// the class for the provider

class Parent with ChangeNotifier{
  List <ParentInf> parentsList = [];

   late ParentInf _inf ; // we will put the data that we will get at this variable

  // we will get the _inf variable by calling this function
  ParentInf getParentInf(){
      return _inf;
  }


  // we will insert the data using this function
  void setParentInf(ParentInf inf){
      _inf=inf;
      print(_inf);
      notifyListeners();
  }

  void Registration(ParentInf parentData) {
      final data =  ParentInf(schoolID:parentData.schoolID, studentID: parentData.studentID, name: parentData.name, email: parentData.email, address: parentData.address, number: parentData.number,password: parentData.password);
      parentsList.add(data);
  }

  //we will use this function to login and get parent infromation by passing the username and password to it
  // we use it Future Boolean <so when we use it we check if the user logged properly return true other wise return false>
  //  Future<bool> loginParentAndGetInf(String user,String pass) async{
  //   var response;
  //   var datauser;
  //   try{
  //     var response = await http.post(
  //            Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  //             body: {
  //               "username": user.trim(), // we use trim method to avoid spaces that user may make when logging 
  //               "password": pass.trim(), // we use trim method to avoid spaces that user may make when logging
  //             });
  //   if(response.statusCode == 200){ // if every things are right decode the response and insertInf then return true
  //   datauser = await json.decode(response.body);
  //   insertInf(datauser);
  //   return true;
  //   }
  //   print(datauser);
  //   }catch(e){
  //     print(e); // else print the error then return false
  //   }
  // return false;
  // }
  // void loginParentAndGetInf(String user,String pass) {
  //   if(_parentsList.first.name == user && _parentsList.first.password == pass){
  //     //Navigator.of(context).pushNamed(MainParentPage.routeName);
  //     //Navigator.of(context).pushNamed(MainParentPage.routeName);
      
  //   }
  // }

// i just used this function to make the code more organised and not so messed
  insertInf(dynamic datauser){

       ParentInf parentInf = ParentInf(
          id: datauser[0]['id'],
          studentID: datauser[0]['student_id'],
          schoolID: datauser[0]['school_id'],
          name: datauser[0]['name'],
          address: datauser[0]['address'],
          number: datauser[0]['number'],
          email: datauser[0]['email'],
          dateOfRegister: datauser[0]['date_of_register']);
          // after inserting then pass it to setParentInf to insert the data to our _inf variable
          setParentInf(parentInf);
  }

  
  logOut(){
    _inf= ParentInf(); // we will empty the _inf variable cause the user logged out
    notifyListeners();
    print(_inf.id);
  }
 }