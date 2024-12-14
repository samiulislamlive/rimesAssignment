import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  String title;
  Color color;
  InfoWidget({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
              color: title == "Normal" || title == "Extreme"
                  ? Colors.white
                  : Colors.black,
              fontSize: 14),
        ),
      ),
    );
  }
}
