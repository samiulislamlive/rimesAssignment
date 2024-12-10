import 'package:flutter/material.dart';

import 'view/homeMap.dart';


void main() {
  runApp(const RimesMap());
}

class RimesMap extends StatelessWidget {
  const RimesMap({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeMap(),
    );
  }
}
