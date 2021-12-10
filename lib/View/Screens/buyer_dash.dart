import 'package:bunyaad/Controller/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:bunyaad/View/Widgets/CustomAppBar.dart';

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

  fetchservices() async{
    dynamic resultant= await ServiceController().getServices();

    if(resultant==null){
      print("Unable to retrieve");
    }
    else{
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
          appBar: CustomAppBar(title: "Bunyaad", tabBar:
          TabBar(tabs: [
              Tab(
                child: Text("Products"),),
              Tab(child: Text("Construction"),),
              Tab(child: Text("Contracting"),),
              Tab(child: Text("Designing"),)
            ]),),
          body:
            Padding(
            padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
                itemCount: servicelst.length,
                itemBuilder: (BuildContext ctx, index) {
                return
                  Container(
                alignment: Alignment.center,
                child: Text(servicelst[index]["Name"],style: TextStyle(backgroundColor: Colors.white),),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(servicelst[index]["image "]),
                        fit: BoxFit.cover
                  )
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
