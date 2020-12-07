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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Bitel',
              style: TextStyle(color: Colors.black, fontSize: 22.0)),
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://avatars2.githubusercontent.com/u/12468902?s=460&u=af12dd749e68b45862f389cd57bc7da901ab24e6&v=4'),
              ),
              Text(
                'Abel Tarazona',
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '970080498',
                    style:
                        TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'abel.tarazona@bitel.com.pe',
                    style:
                        TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.map,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Perú',
                    style:
                        TextStyle(color: Colors.teal.shade900, fontSize: 20.0),
                  ),
                ),
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
