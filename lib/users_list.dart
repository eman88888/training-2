import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userslist extends StatefulWidget {
  const userslist({super.key});

  @override
  State<userslist> createState() => _ProductListState();
}

class _ProductListState extends State<userslist> {
  CollectionReference usersDoc = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<QuerySnapshot<Object?>>(
          future: usersDoc.get(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData == false && snapshot.data == null) {
              return Text("Document does not exist");
            }
            print(snapshot.connectionState.toString());
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                      "Full Name: ${snapshot.data!.docs[index]['name']} ${snapshot.data!.docs[index]['email']}");
                },
              );
            }
            return Text("loading");
          },
        ));
  }
}
