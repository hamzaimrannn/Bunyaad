import 'package:bunyaad/View/Screens/buyer_dash.dart';
import 'package:bunyaad/View/Screens/landing_page.dart';
import 'package:bunyaad/View/Subscreens/Add%20Service.dart';
import 'package:bunyaad/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Seller_dashboard extends StatefulWidget {
  const Seller_dashboard({Key? key}) : super(key: key);

  @override
  _Seller_dashboardState createState() => _Seller_dashboardState();
}

class _Seller_dashboardState extends State<Seller_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sellers Dashboard', style: TextStyle(color: Colors.blueGrey[100], fontSize: 24)),
        actions: [
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LandingPage()));
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.blueGrey[100]),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      child: SizedBox(
                        width: 100,
                      )
                  )
              ),
               Expanded(
                flex: 1,
                child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => buyerdashboard()));
                      },
                      child: Text("Add services"),
                    ),
                  ),
                ),
            ],
          )
        ]),
      ),
    );
  }
}
