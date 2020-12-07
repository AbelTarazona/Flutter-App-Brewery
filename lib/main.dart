import 'package:flutter/material.dart';

//The main function is the starting point for all our Flutter apps
void main() {
  runApp(MyCard());
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/JECdtjj3CE6Rt3E3EYW4X7lbkpqi7mMGlVDkljf3l76Bh8H4qhlwSgz8YvW_BLXD1Blfz80B2NwbP24cZX1A2aWfFIixNooOOKnjiB4dGCmRV-fml5tz=w1280'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InitialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Monster", style: TextStyle(color: Colors.white70)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/52614b19-d6dc-4cd1-9b2e-a62db03067ff/d9hog0i-c2406ff4-ba8d-415a-8a81-a55d59a75e64.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNTI2MTRiMTktZDZkYy00Y2QxLTliMmUtYTYyZGIwMzA2N2ZmXC9kOWhvZzBpLWMyNDA2ZmY0LWJhOGQtNDE1YS04YTgxLWE1NWQ1OWE3NWU2NC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.JSB4hYRPk7lvwfdPLZmSwgA4vlWC-QSbpB-LplvhT2Q'),
          height: 250,
        ),
      ),
    );
  }
}
