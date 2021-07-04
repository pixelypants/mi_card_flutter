import 'package:flutter/material.dart';
import './themes/pixelypants_kit.dart';
import './components/info_card.dart';

void main() {
  runApp(PixelypantsApp());
}

class PixelypantsApp extends StatefulWidget {
  @override
  _PixelypantsAppState createState() => _PixelypantsAppState();
}

class _PixelypantsAppState extends State<PixelypantsApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: PixelypantsKit.lightTheme,
        darkTheme: PixelypantsKit.darkTheme,
        themeMode: currentTheme.currentTheme,
        home: App(
          title: 'FLUTTER DEVELOPER',
          name: 'Hudson Graham',
          email: 'hudson.graham@gmail.com',
          number: '+61 111  222 333',
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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: theme.accentColor,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_rounded),
            onPressed: () {
              currentTheme.toggleTheme();
            },
          ),
        ],
      ),
      backgroundColor: Colors.purple,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.2,
                1.0,
              ],
              colors: [
                PixelypantsKit.gradientColorA, //Colors.teal.shade600,
                PixelypantsKit.gradientColorB //Colors.teal.shade600,
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
    );
  }
}
