import 'package:ebook/constant.dart';
import 'package:ebook/screen/login_page/signupPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String route = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20,),
          )
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Login", style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),),
                SizedBox(height: 20,),
                Text("Login to your account",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),)
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  makeInput(label: "Email",),
                  makeInput(label: "Password", obscureText: true)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                padding: EdgeInsets.only(top: 3,left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {Navigator.pushNamed(context, 'home');},
                  height: 60,
                  color: cardColor,
                  child: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?"),
                GestureDetector(onTap: ()=>Navigator.pushNamed(context, SignUpPage.route),child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),))
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height/3,
            )
          ],
        ),

      ),
    );
  }
}
