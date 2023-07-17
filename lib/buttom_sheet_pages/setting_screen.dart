import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingscreenState();
}

class _settingscreenState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("setting"),
    );
  }
}
