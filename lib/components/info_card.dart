import 'package:flutter/material.dart';
import '../themes/pixelypants_kit.dart';

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
      color: PixelypantsKit.cardBackgroundColor,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: PixelypantsKit.iconColor,
          ),
          title: Text(text, style: Theme.of(context).textTheme.bodyText1),
        ),
      ),
    );
  }
}
