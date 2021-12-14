import 'package:bunyaad/Controller/services_controller.dart';
import 'package:bunyaad/Model/Service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bunyaad/View/Widgets/CustomAppBar.dart';
import 'ServiceDetails.dart';

class buyerdashboard extends StatefulWidget {
  const buyerdashboard({Key? key}) : super(key: key);

  @override
  _buyerdashboardState createState() => _buyerdashboardState();
}

class _buyerdashboardState extends State<buyerdashboard> {
  @override
  List servicelst = [];

  void initState() {
    super.initState();
    fetchservices();
  }

  fetchservices() async {
    dynamic resultant = await ServiceController().getServices();

    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        servicelst = resultant;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
              appBar: CustomAppBar(
                title: "Bunyaad",
                tabBar: TabBar(tabs: [
                  Tab(
                    child: Text("Products"),
                  ),
                  Tab(
                    child: Text("Construction"),
                  ),
                  Tab(
                    child: Text("Contracting"),
                  ),
                  Tab(
                    child: Text("Designing"),
                  )
                ]),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                            child: Text(
                              "Explore Services",
                              style: TextStyle(fontFamily: "Comfortaa", fontSize: 24, color: Colors.red.shade400),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.6,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                          child:

                          // StreamBuilder(
                          //   stream: FirebaseFirestore.instance.collection("serviceinfo").snapshots(),
                          //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          //     if (!snapshot.hasData) {
                          //       return const Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     }
                          //
                          //   })
                        servicesView(),
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }

  Widget servicesView() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 350, crossAxisSpacing: 40, mainAxisSpacing: 40),
        itemCount: servicelst.length,
        itemBuilder: (BuildContext ctx, index) {
          return Card(
              child: InkWell(
                  onTap: () async {
                    Service ser = Service(servicelst[index]["Name"], servicelst[index]["Area"], servicelst[index]["Catergory"],
                        servicelst[index]["Description"],
                        servicelst[index]["Unit"],
                        servicelst[index]["Price"],
                        servicelst[index]["uid"],
                        servicelst[index]["image"]);
                    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServicesDetails( serviceID: servicelst[index]["Id"], myser: ser) ));
                  },
                  splashColor: Colors.blueGrey,
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(servicelst[index]["image "]),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(servicelst[index]["Name"], style: TextStyle(fontFamily: "Comfortaa", fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(servicelst[index]["Price"].toString() + " Rs", style: TextStyle(fontFamily: "Comfortaa", color: Colors.purpleAccent, fontSize: 17))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(servicelst[index]["Area"].toString(), style: TextStyle(fontFamily: "Comfortaa", color: Colors.grey.shade400, fontSize: 12)), IconButton(constraints: BoxConstraints(), padding: EdgeInsets.zero, onPressed: () {}, icon: Icon(Icons.thumb_up_alt_outlined))],
                        ),
                      )
                    ],
                  )));
        });
  }


}
