import 'package:bunyaad/View/Screens/LoginPage.dart';
import 'package:bunyaad/View/Screens/seller_signup.dart';
import 'package:bunyaad/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 15,
        actions: [
          TextButton(
              onPressed:(){
                print("login");
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
                //Navigator.pushNamed(context, "");
              },
              child: Text("Login",style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"))),
          SizedBox(width: 8.0,),
          TextButton(

              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SellerSignup()));
          }, child: Text("Become a Seller",style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"),)),
          SizedBox(width: 8.0,),
          TextButton(onPressed: (){
            print('Sign up');
          }, child: Text("Signup",style: TextStyle(color: Colors.white, fontFamily: "Comfortaa"))),
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: Stack(
        alignment: const Alignment(0.6, 0.6),
          children: [
            Container(

      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1533378890784-b2a5b0a59d40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=837&q=80"),
              fit: BoxFit.cover
          )
      ),
              child: Container(margin: const EdgeInsets.only(top: 280.0, left: 25.0),
                child: const Text(
                "BUNYAAD \n     -everything is better with a foundation",
                style: TextStyle(
                  fontSize: 46,
                  fontFamily: "Comfortaa",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
    )),]
      ));
  }
}
