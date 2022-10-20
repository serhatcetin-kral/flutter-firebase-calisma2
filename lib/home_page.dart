import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _firestore=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    CollectionReference moviesRef=_firestore.collection("MOVIES");


    var karasovalyeRef=moviesRef.doc("karasovalye");

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('firestore CRUD islemeleri'),),
      body: Center(
        child: Container(

          child: Column(children:[

    ElevatedButton(child:Text("GET QUERYSNAPSHOT"),onPressed:() async{
      var response=await moviesRef.get();
      var list=response.docs;
      print(list.first.data());
      print(list[1].data());


    }
    )]
        ),
      ),
    ),
    );
  }
}



///////////////////////////////koleksiyon verisi
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class HomePage extends StatefulWidget {


//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   final _firestore=FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {

//     CollectionReference moviesRef=_firestore.collection("MOVIES");


//     var karasovalyeRef=moviesRef.doc("karasovalye");

//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(title: Text('firestore CRUD islemeleri'),),
//       body: Center(
//         child: Container(

//           child: Column(children:[

//     ElevatedButton(child:Text("GET QUERYSNAPSHOT"),onPressed:() async{
//       var response=await moviesRef.get();
//       var list=response.docs;
//       print(list.first.data());
//       print(list[1].data());

//     }
//     )]
//         ),
//       ),
//     ),
//     );
//   }
// }



