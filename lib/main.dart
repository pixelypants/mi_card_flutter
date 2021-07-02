import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Source Sans Pro',
          textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.teal[900],
                fontSize: 20.0,
              ),
              bodyText2: TextStyle(
                fontSize: 16.0,
                color: Colors.teal[100],
                letterSpacing: 5.5,
                fontWeight: FontWeight.bold,
              ),
              headline1: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                color: Colors.white,
              )),
        ),
        home: App(
          title: 'FLUTTER DEVELOPER',
          name: 'Hudson Graham',
          email: 'hudson.graham@gmail.com',
          number: '+61 428  832 249',
        ));
  }
}

class App extends StatefulWidget {
  final String name;
  final String title;
  final String number;
  final String email;

  const App(
      {Key key,
      @required this.name,
      @required this.title,
      @required this.number,
      @required this.email})
      : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  double widget1Opacity = 0.0;

  // @override
  void initState() {
    super.initState();
    debugPrint("here $widget1Opacity");
    Future.delayed(Duration(milliseconds: 300), () {
      widget1Opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.2,
                  1.0,
                ],
                colors: [
                  Colors.teal[600],
                  Colors.purple,
                ]),
          ),
          child: AnimatedOpacity(
            opacity: widget1Opacity,
            duration: const Duration(milliseconds: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/avatar.jpeg'),
                ),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                InfoCard(icon: Icons.phone, text: widget.number),
                InfoCard(icon: Icons.email, text: widget.email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String text;

  InfoCard({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(text, style: Theme.of(context).textTheme.bodyText1),
        ),
      ),
    );
  }
}
