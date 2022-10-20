import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Future<void> main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(HomePage());
// }

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _firestore=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    CollectionReference moviesRef=_firestore.collection("MOVIES");

   // var karasovalyeRef=_firestore.collection("MOVIES").doc("karasovalye");
    var karasovalyeRef=moviesRef.doc("karasovalye");

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('firestore CRUD islemeleri'),),
      body: Center(
        child: Container(

          child: Column(children:[
           // Text('${karasovalyeRef.path}',style: TextStyle(fontSize: 24),),
    ElevatedButton(child:Text("get data"),onPressed:() async{
      var response=await karasovalyeRef.get();
    //documentsnaphot
    //veriyi dokument snaphot icinden cikar
     var map=response;
    print(map['name']);
      print(map['year']);
      print(map['rate']);

    }
    )]
        ),
      ),
    ),
    );
  }
}

