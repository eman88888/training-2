import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profiles extends StatefulWidget {
  const profiles({super.key});

  @override
  State<profiles> createState() => _profilescreenState();
}

class _profilescreenState extends State<profiles> {
  @override
  void initState() {
    super.initState();
    getemail();
  }

  String useremail = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(useremail),
    );
  }

  getemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    useremail = prefs.getString("email") ?? "--";
    setState(() {});
  }
}
