import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    final TextEditingController emailcontroller = TextEditingController();
    String email = "";
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 70, 167),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
                width: 1000,
                height: 400,
                child: Image.asset("assets/dart1.jpg")),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'email',
                ),
                //onChanged: (value) {
                // email = value;
                // },
                validator: (value) {
                  if (value!.contains("@")) {
                    return null;
                  } else {
                    return "Not valid email";
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'password',
                ),
                validator: (value) {
                  if (value!.length < 7) {
                    return "password should contain 8 characters or more";
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            CupertinoButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  saveemail(emailcontroller.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => screenpage(
                              email: emailcontroller.text,
                            )),
                  );
                }
              },
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                ),
              ),
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('forget password? click here',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
          ],
        ),
      )),
    );
  }

  saveemail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}
