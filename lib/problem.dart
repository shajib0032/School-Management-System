import 'package:flutter/material.dart';
class Problem extends StatefulWidget {
  static const routeName ='/problem';
  const Problem({ Key? key }) : super(key: key);

  @override
  _ProblemState createState() => _ProblemState();
}

class _ProblemState extends State<Problem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('problem'),),
    );
  }
}