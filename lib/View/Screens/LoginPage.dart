
import 'package:bunyaad/Controller/auth_controller.dart';
import 'package:bunyaad/View/Screens/buyer_dash.dart';
import 'package:bunyaad/View/Subscreens/Add%20Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Seller_dash.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(children: <Widget>[
          Center(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.red],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 100,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Comfortaa",
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        emailField(),
                        SizedBox(
                          height: 10,
                        ),
                        passwordField(),
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            loginButton(),
                            SizedBox(
                              width: 330,
                            )
                          ],
                        ),
                      ]),
                )),
          ),
        ]),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2))],
      ),
      child: ElevatedButton(
        onPressed: () async{
          bool check = await Controller.loginUser(email: emailController.text.toString(), password:passwordController.text.toString());
            if(check){
              print("user entered");
              Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => AddService()));
              //Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => HomePage()));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Wrong Credentials",style: TextStyle(
                    color: Colors.white,
                        fontWeight: FontWeight.bold
                  ),),
                   ));
            }
        },
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(15.0),
            backgroundColor:
                MaterialStateProperty.all(Colors.green.shade300),
            padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: (BorderRadius.circular(15.0)),
              ),
            )),
        child: Text("Login",
            style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget passwordField() {
    return Container(width: 650,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(
            fontFamily: "Comfortaa",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2))],
          ),
          height: 60,
          child: TextFormField(
            obscureText: true,
            controller: passwordController,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              // helperText: "Email",
              contentPadding: EdgeInsets.only(top: 14),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.red.shade400,
                size: 24,
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget emailField() {
    return Container(width: 650,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(
            fontFamily: "Comfortaa",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2))],
          ),
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            autofillHints: ["Email"],
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              // helperText: "Email",
              contentPadding: EdgeInsets.only(top: 14),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.email,
                color: Colors.red.shade400,
                size: 24,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
