import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskdb/pages/home_page.dart';
import 'package:taskdb/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  static final String id = 'login_page';

  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() {
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box('taskdb');

    String getter_username = box.get('username');
    String getter_password = box.get('password');

    if (username == getter_username && password == getter_password) {
      Navigator.pushReplacementNamed(context, HomePage.id);
    }
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

                  // User image
                  Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/images/ic_image4.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Text('Welcome Back!', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),

                  SizedBox(height: 10,),

                  Text('Sign in to continue', style: TextStyle(color: Colors.white, fontSize: 20),),

                  SizedBox(height: 60,),

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

                  SizedBox(height: 20,),

                  Text('Forgot Password?', style: TextStyle(color: Colors.grey),),

                  SizedBox(height: 50,),

                  GestureDetector(
                    onTap: _doLogin,
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
                      Text('Don\'t have an account? ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2),),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignupPage.id);
                        },
                        child: Text('SIGN UP', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2),),
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
