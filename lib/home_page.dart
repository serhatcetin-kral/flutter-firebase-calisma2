import 'dart:ffi';

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
  TextEditingController nameController=TextEditingController();//bu ayarlar taxt kutulari ayarlari icin kullanilir
  TextEditingController rateController=TextEditingController();


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
                            trailing: IconButton(icon: Icon(Icons.delete),
                              onPressed: () async{
                              //fire basede data silmek icin  delete metodu
                                await listOfDocumentSnapshot[index].reference.delete();

                              },),

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
           ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 169),
              child: Form(child: Column(children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "enter film name"),
                ),
                TextFormField(
                  controller: rateController,
                  decoration: InputDecoration(hintText: "enter rate"),
                ),



              ],)),
            )

          ]
          ),
        ),
      ),
     floatingActionButton: FloatingActionButton(
       child: Text("Add"),
       onPressed: () async {
         print(nameController.text);
         print(rateController.text);
       
         //data base gonermek iicn bilgileri map olustur
         Map<String,dynamic> moviData={'name':nameController.text,'rate':rateController.text};
// firebase gonderme metodu

       await moviesRef.doc(nameController.text).set(moviData);//film adi ve id ayni olugu icin boyle yaptik
  // ayni isimde filmi eklemez id isim ile ayni diye set metodu ile guncellemede yapabilirsin isim disinda diyerlerini guncelleyebilirsin
        // await moviesRef.doc(nameController.text).update({'year':301});

       },),

    );
  }
}

///////////////////////////////////////////////////////////////yukaridaki kisim firebase data ekleme ve update etmeli
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
                            trailing: IconButton(icon: Icon(Icons.delete),
                              onPressed: () async{
                              //fire basede data silmek icin  delete metodu
                                await listOfDocumentSnapshot[index].reference.delete();

                              },),

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

////////////////////yukaridaki kisim delete butonlari eklenmis hali
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



//               if(asyncSnaphot.hasError){
//                 return Center(child: Text("some error is occured"),);
//               }
//               else{
//                 if(asyncSnaphot.hasData){
//                   List<DocumentSnapshot> listOfDocumentSnapshot=asyncSnaphot.data.docs;
//                   return  Flexible(
//                     child: ListView.builder(
//                       itemCount: listOfDocumentSnapshot.length,
//                       itemBuilder: (context,index){

//                         return Card(
//                           child: ListTile(
//                             title:Text("${listOfDocumentSnapshot[index].get('name')}",style: TextStyle(fontSize: 24),),
//                             subtitle:  Text("${listOfDocumentSnapshot[index].get('year')}",style: TextStyle(fontSize: 16),),

//                           ),
//                         );


//                       },
//                     ),
//                   );
//                 }
//                 else{

//                   return Center(child: CircularProgressIndicator(),);
//                 }
//               }


//             })
//           ]
//           ),
//         ),
//       ),
//     );
//   }
// }









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



