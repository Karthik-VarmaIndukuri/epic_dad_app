import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/admin_page.dart';
import 'package:showcaseview/showcaseview.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  get id => 'admin_login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage( "images/login.jpg"),
              fit: BoxFit.fitHeight
          )
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("doctor login"),
      ),
      body:  Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(50,50,50,10),
              child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepPurpleAccent, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                      ),
                      hintText: "Enter Username",
                      filled: true
                  ),
                maxLength: 50,
                  onChanged: (text){
                   email=text;
                  }
              ),
            ),
            //emailid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.deepPurpleAccent, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                      ),
                      hintText: "Enter Password",
                      filled: true
                  ),
                maxLength: 50,
                onChanged: (text){
                  password=text;
                }
              ),
            ),
            //password
            FloatingActionButton(
                child:Text("log in"),onPressed:() async{
              try{
                print(email);
                print(password);

              // final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
               if(email=="tarun@123" && password=="1820")
                {
                  Navigator.pushNamed(context,Admin().id);
                }
               else{
                    showtoast();
               }
            }
            catch(e)
            {
              print(e);
            }
            }
            )
          ],

        ),
      ),
    );
  }

  void showtoast()=>Fluttertoast.showToast(msg: "enter proper credentials",fontSize: 18,
      backgroundColor: Colors.white,textColor: Colors.black);
}
