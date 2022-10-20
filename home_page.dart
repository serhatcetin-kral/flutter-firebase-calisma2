import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('firestore CRUD islemeleri'),),
      body: Center(
        child: Container(
          child: Text('home page',style: TextStyle(fontSize: 24),),
        ),
      ),


    );
  }
}

