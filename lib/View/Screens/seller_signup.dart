import 'package:bunyaad/Controller/auth_controller.dart';
import 'package:bunyaad/View/Screens/Seller_dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellerSignup extends StatefulWidget {
  @override
  _SellerSignupState createState() => _SellerSignupState();
}

class _SellerSignupState extends State<SellerSignup> {
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
                    // color: Colors.blueGrey,
                    color: Theme.of(context).primaryColor),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 100,
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    Text(
                      "Sign up page",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    emailField(),
                    SizedBox(
                      height: 10,
                    ),
                    passwordField(),
                    SizedBox(
                      height: 20,
                    ),
                    signupButton(),
                  ]),
                )),
          ),
        ]),
      ),
    );
  }

  Widget signupButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2))],
      ),
      child: ElevatedButton(
        onPressed: () async {
          bool check = await Controller.SignupUser(email: emailController.text.toString(), password: passwordController.text.toString(), isSeller: true);
          if (check) {
            print("User Created");
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => Seller_dashboard()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "User not created",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ));
          }
        },
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(15.0),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
            padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: (BorderRadius.circular(15.0)),
              ),
            )),
        child: Text("Signup", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(
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
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(
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
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}
