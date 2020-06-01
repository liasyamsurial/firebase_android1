import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class WaterLevel extends StatefulWidget {
  @override
  _WaterLevelState createState() => _WaterLevelState();
}

class _WaterLevelState extends State<WaterLevel> {

  final fb = FirebaseDatabase.instance;
  var retrievedLevel="";
  String level = "";

  @override
  Widget build(BuildContext context) {
    final ref=fb.reference().child("banjir rescue 2");
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Level"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Level',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(
                      blurRadius: 10,
                      color: Colors.blue,
                    )]
                ),
              ),
            ),
            Flexible(child: TextField(
              onChanged: (val){
                setState(() {
                  level=val;
                });
              },
            )),
            RaisedButton(
              onPressed: (){
                ref.child("Level").set(level);
              },
              child: Text("Water Level"),
            ),
            RaisedButton(
              onPressed: (){
                ref.child("Level").once().then((DataSnapshot data){
                  setState(() {
                    retrievedLevel=data.value;
                  });
                });
              },
              child: Text("Retrieve data"),
            ),
            Text(retrievedLevel),
          ],
        ),
      ),
    );
  }

}