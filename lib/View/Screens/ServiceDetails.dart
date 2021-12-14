import 'package:bunyaad/Model/Service.dart';
import 'package:bunyaad/View/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class ServicesDetails extends StatefulWidget {
  String? serviceID;

  ServicesDetails({required this.serviceID, required this.myser});

  final Service myser;

  @override
  _ServicesDetailsState createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.myser.name);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 0,
            child: Scaffold(
              appBar: CustomAppBar(
                title: "Bunyaad",
                tabBar: TabBar(
                  tabs: [],
                ),
              ),
              body: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Service Details",
                          style: TextStyle(fontSize: 24, fontFamily: "Comfortaa", color: Colors.red.shade400),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        margin: EdgeInsets.fromLTRB(15, 10, 5, 10),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(),
                            Row(),
                            Row(),
                            Row(),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text(" "),
                      ),
                    ],
                  ),
                ],
              ),
              // body: Text("${widget.serviceID}"),
            )));
  }
}
