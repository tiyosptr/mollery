import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RelTimeData(),
    );
  }
}

class RelTimeData extends StatelessWidget {
  RelTimeData({super.key});
  Query dbRef = FirebaseDatabase.instance.ref().child('Students');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Realtime Database"),
      ),
      body: Column(children: [
        Expanded(
            child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: ((context, snapshot, animation, index) {
            return ListTile(
              title: Text(snapshot.child('deskripsi').value.toString()),
            );
          }),
        ))
      ]),
    );
  }
}
