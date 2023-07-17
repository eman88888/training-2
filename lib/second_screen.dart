import 'package:flutter/material.dart';
import 'package:flutter_application/buttom_sheet_pages/main_screen.dart';
import 'package:flutter_application/buttom_sheet_pages/profile_screen.dart';
import 'package:flutter_application/buttom_sheet_pages/setting_screen.dart';

class screenpage extends StatefulWidget {
  final String email;
  const screenpage({
    super.key,
    required this.email,
  });

  @override
  State<screenpage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<screenpage> {
  int selectedindex = 0;
  List<Widget> page = [
    mains(),
    profiles(),
    settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my screen"),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          page[selectedindex],
          //Container(
          // width: 1000, height: 300, child: Image.asset("assets/dart.png")),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          // Text(widget.email),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        onTap: (pageindex) {
          selectedindex = pageindex;
          setState(() {});
        },
      ),
    );
  }
}
