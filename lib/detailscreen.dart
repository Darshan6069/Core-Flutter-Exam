
import 'dart:io';
import 'dart:math';

import 'package:exam/main.dart';
import 'package:exam/modelclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String gr;
  final String Name;
  final String Std;
  final File? Image;
  const DetailsScreen({Key? key, required this.gr, required this.Name, required this.Std, required this.Image}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.greenAccent,
automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:Icon(CupertinoIcons.back,color: Colors.black,) ),
        title: Text('Details Screen', style: TextStyle(
            letterSpacing: 1,
            fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
              child: Container(
                width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent.shade100
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80.0,top: 15),
                child: CircleAvatar(

                  backgroundColor: Colors.white,
                  backgroundImage: FileImage(widget.Image! as File),
                  radius: 55,
                ),
              ),
              SizedBox(height: 35,),
              SelectableText('Gr Id    :   ${widget.gr}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 18,),
              SelectableText('Name  :   ${widget.Name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(height: 18,),
              SelectableText('Std       :   ${widget.Std}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
            ],
          ),
                  ))),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: (){
           setState(() {
             StudentData.remove(e);
           });
           Navigator.of(context).pushAndRemoveUntil(
               MaterialPageRoute(builder: (context) => MyHomePage()),
                   (route) => false);
          }, child: Text('Delete'),

          )
        ],
      ),
    );
  }
}
