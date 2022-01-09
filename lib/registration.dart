import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/parent.dart';
import 'package:school_management/screens/login_page.dart';
// import 'package:school_management/screens/login_page.dart';
import 'package:school_management/screens/parent/main_parent_page.dart';


class Registration extends StatefulWidget {
static const routeName = '/';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  
  final _fromkey = GlobalKey<FormState>();
  var setParentInfo =  ParentInf(schoolID: '', studentID: '', name: '', email: '', address: '', number: '', password: '');
  void saveData(){
    _fromkey.currentState!.save();
    //print(setParentInfo.name);
     //print(setParentInfo.password);
    Provider.of<Parent>(context, listen: false).Registration(setParentInfo);
    Navigator.of(context).pushNamed(Login.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Form(
          key: _fromkey,
          child: Column(
          children: [
            TextFormField(
              onSaved: (newvalue){
                setParentInfo =  ParentInf(schoolID: newvalue, studentID: setParentInfo.studentID, name: setParentInfo.name, email: setParentInfo.email, address: setParentInfo.address, number: setParentInfo.number,password: setParentInfo.password);
              },
              decoration: InputDecoration(
                hintText: 'School ID:'
              ),
            ),
            TextFormField(
              onSaved: (newvalue){
                setParentInfo =  ParentInf(schoolID: setParentInfo.schoolID, studentID: newvalue, name: setParentInfo.name, email: setParentInfo.email, address: setParentInfo.address, number: setParentInfo.number,password: setParentInfo.password);
              },
              decoration: InputDecoration(
                hintText: 'Student ID:'
              ),
            ),
            TextFormField(
              onSaved: (newvalue){
                setParentInfo =  ParentInf(schoolID: setParentInfo.schoolID, studentID: setParentInfo.studentID, name: newvalue, email: setParentInfo.email, address: setParentInfo.address, number: setParentInfo.number,password: setParentInfo.password);
              },
              decoration: InputDecoration(
                hintText: 'Student Name:'
              ),
            ),
            TextFormField(
              onSaved: (newvalue){
                setParentInfo =  ParentInf(schoolID: setParentInfo.schoolID, studentID: setParentInfo.studentID, name: setParentInfo.name, email: newvalue, address: setParentInfo.address, number: setParentInfo.number,password: setParentInfo.password);
              },
              decoration: InputDecoration(
                hintText: 'Email Account:'
              ),
            ),
            TextFormField(
              onSaved: (newvalue){
                setParentInfo =  ParentInf(schoolID: setParentInfo.schoolID, studentID: setParentInfo.studentID, name: setParentInfo.name, email: setParentInfo.email, address: newvalue, number: setParentInfo.number,password: setParentInfo.password);
              },
              decoration: InputDecoration(
                hintText: 'Address:'
              ),
            ),
            TextFormField(
              onSaved: (newvalue){
                setParentInfo =  ParentInf(schoolID: setParentInfo.schoolID, studentID: setParentInfo.studentID, name: setParentInfo.name, email: setParentInfo.email, address: setParentInfo.address, number: newvalue,password: setParentInfo.password);
              },
              decoration: InputDecoration(
                hintText: 'Phone Number:'
              ),
            ),
            TextFormField(
              obscureText: true,
              onSaved: (newvalue){
                setParentInfo =  ParentInf(schoolID: setParentInfo.schoolID, studentID: setParentInfo.studentID, name: setParentInfo.name, email: setParentInfo.email, address: setParentInfo.address, number: setParentInfo.number, password: newvalue);
              },
              decoration: InputDecoration(
                hintText: 'Type a new password'
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(onPressed: saveData, child: Text("Submit"))
          ],
        )
        
        ),
      ),
    );
  }
}