import 'dart:io';

import 'package:exam/main.dart';
import 'package:exam/modelclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({Key? key}) : super(key: key);

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  File? _image;
  TextEditingController Grid = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Std = TextEditingController();

  getImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( backgroundColor: Colors.greenAccent,
        title: Text('Add Data',style: TextStyle(
            letterSpacing: 1,
            fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:Icon(CupertinoIcons.back,color: Colors.black,) ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    getImage();
                  });
                },
                child: (_image != null)
                    ? CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.black45,
                        backgroundImage: FileImage(_image!),
                        child: Icon(Icons.add_a_photo_outlined))
                    : CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.black45,
                        child: Icon(Icons.add_a_photo_outlined))),
            Container(
              width: double.infinity,
              height: 300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: double.infinity,
                        height: 49,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: Grid,
                          decoration: InputDecoration(
                            hintText: 'Enter Grid',
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: double.infinity,
                        height: 49,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: Name,
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: double.infinity,
                        height: 49,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: Std,
                          decoration: InputDecoration(
                            hintText: 'Enter Std',
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      print(Grid);
                      print(Name);
                      print(Std);
                      setState(() {
                        StudentData.add(ModelClass(
                            grid: Grid.text, name: Name.text, std: Std.text, Image: _image));
                      });
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                          (route) => false);
                      print(StudentData);
                    },
                    child: Container(
                      width: 90,
                      height: 40,
                      child: Center(child: Text('Submit')),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
