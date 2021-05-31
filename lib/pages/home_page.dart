import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getName() {
    var box = Hive.box('taskdb');
    return box.get('username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(26, 29, 55, 255),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome', style: TextStyle(letterSpacing: 1.2, fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),

          SizedBox(height: 15,),

          Text(getName(), style: TextStyle(letterSpacing: 1.2, fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
        ],
      ),
      ),
    );
  }
}