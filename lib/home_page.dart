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

            // ElevatedButton(child:Text("GET QUERYSNAPSHOT"),onPressed:() async{
            //   var response=await moviesRef.get();
            //   var list=response.docs;
            //   print(list.first.data());
            //   print(list[1].data());
            //
            // }
            // ),
            //stream builder canli degistirmeyi saglar data basde birsey degisince programida degistirir
            StreamBuilder<QuerySnapshot>(
                stream:moviesRef.snapshots(),builder:(BuildContext context,AsyncSnapshot asyncSnaphot)
            {



              if(asyncSnaphot.hasError){
                return Center(child: Text("some error is occured"),);
              }
              else{
                if(asyncSnaphot.hasData){
                  List<DocumentSnapshot> listOfDocumentSnapshot=asyncSnaphot.data.docs;
                  return  Flexible(
                    child: ListView.builder(
                      itemCount: listOfDocumentSnapshot.length,
                      itemBuilder: (context,index){

                        return Card(
                          child: ListTile(
                            title:Text("${listOfDocumentSnapshot[index].get('name')}",style: TextStyle(fontSize: 24),),
                            subtitle:  Text("${listOfDocumentSnapshot[index].get('year')}",style: TextStyle(fontSize: 16),),

                          ),
                        );


                      },
                    ),
                  );
                }
                else{

                  return Center(child: CircularProgressIndicator(),);
                }
              }


            })
          ]
          ),
        ),
      ),
    );
  }
}









/////////////////////////////////////////////////////////////////////usteki kisim hata bakamali
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

//             // ElevatedButton(child:Text("GET QUERYSNAPSHOT"),onPressed:() async{
//             //   var response=await moviesRef.get();
//             //   var list=response.docs;
//             //   print(list.first.data());
//             //   print(list[1].data());
//             //
//             // }
//             // ),
//             //stream builder canli degistirmeyi saglar data basde birsey degisince programida degistirir
//             StreamBuilder<QuerySnapshot>(
//                 stream:moviesRef.snapshots(),builder:(BuildContext context,AsyncSnapshot asyncSnaphot)
//             {

//               List<DocumentSnapshot> listOfDocumentSnapshot=asyncSnaphot.data.docs;
//               return  Flexible(
//                 child: ListView.builder(
//                     itemCount: listOfDocumentSnapshot.length,
//                    itemBuilder: (context,index){

//                       return Card(
//                         child: ListTile(
//                           title:Text("${listOfDocumentSnapshot[index].get('name')}",style: TextStyle(fontSize: 24),),
//                           subtitle:  Text("${listOfDocumentSnapshot[index].get('year')}",style: TextStyle(fontSize: 16),),

//                         ),
//                       );


//                    },
//                 ),
//               );



//             })
//           ]
//           ),
//         ),
//       ),
//     );
//   }
// }


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



