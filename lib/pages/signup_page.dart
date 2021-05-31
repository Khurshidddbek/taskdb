import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignupPage extends StatefulWidget {
  static final String id = 'signup_page';

  const SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();

  void _doSignup() async {
    String username = usernameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phonenumber = phonenumberController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box('taskdb');

    box.put('username', username);
    box.put('email', email);
    box.put('phonenumber', phonenumber);
    box.put('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(26, 29, 55, 255),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),

                  Text('Create', style: TextStyle(letterSpacing: 1.2, fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),),

                  SizedBox(height: 10,),

                  Text('Account', style: TextStyle(letterSpacing: 1.2, fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),),

                  SizedBox(height: 80,),

                  // UserName TextField
                  Container(
                    child: TextField(
                      controller: usernameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person_outline, color: Colors.grey,),
                        hintText: 'User Name',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(height: 3, color: Colors.grey,),

                  SizedBox(height: 20,),

                  // E-Mail TextField
                  Container(
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.email_outlined, color: Colors.grey,),
                        hintText: 'E-Mail',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(height: 3, color: Colors.grey,),

                  SizedBox(height: 20,),

                  // Phone Number TextField
                  Container(
                    child: TextField(
                      controller: phonenumberController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.phone, color: Colors.grey,),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(height: 3, color: Colors.grey,),

                  SizedBox(height: 20,),

                  // Password TextField
                  Container(
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_open, color: Colors.grey,),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Divider(height: 3, color: Colors.grey,),

                  SizedBox(height: 50,),

                  GestureDetector(
                    onTap: () {
                      _doSignup();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: [
                            Colors.blue,
                            Colors.blue[300],
                            Colors.blue[200],
                          ],
                        ),
                      ),
                      child: Icon(Icons.arrow_right_alt_sharp, size: 40, color: Colors.white,),
                    ),
                  ),

                  Expanded(child: Container(),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2),),

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('SIGN IN', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
