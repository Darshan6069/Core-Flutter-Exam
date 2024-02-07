import 'dart:io';

import 'package:exam/adddatapage.dart';
import 'package:exam/modelclass.dart';
import 'package:flutter/material.dart';

import 'detailscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Home Page",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),

        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...StudentData.map((e) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(
                                  gr: e.grid.toString(),
                                  Name: e.name.toString(),
                                  Std: e.std.toString(),
                                  Image: e.Image!,
                                )));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Row(

                          children: [
                            CircleAvatar(
                              backgroundImage: FileImage(e.Image!),
                              backgroundColor: Colors.white,
                              radius: 33,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 10.0, left: 15),
                              child: Column(
                                children: [
                                  Text(
                                    e.name.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.grid.toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        e.std.toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 102.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showDialog(
                                        context: (context),
                                        builder: (context) {
                                          return Container(
                                              height: 300,
                                              width: 400,
                                              color: Colors.black45,
                                              child: Column(
                                                children: [],
                                              ));
                                        },
                                      );
                                    });
                                  },
                                  icon: Icon(Icons.edit, color: Colors.black,)),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    StudentData.remove(e);
                                  });
                                },
                                icon: Icon(Icons.delete, color: Colors.black,))
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddDataPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add,color: Colors.black,size: 30,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
