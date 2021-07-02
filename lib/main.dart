import 'dart:ui';
import 'package:flutter/material.dart';

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
      {required this.name,
      required this.title,
      required this.number,
      required this.email});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  )..forward(from: 0.0);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  Colors.teal.shade600,
                  Colors.purple,
                ]),
          ),
          child: FadeTransition(
            opacity: _animation,
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
    required this.icon,
    required this.text,
  });

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
