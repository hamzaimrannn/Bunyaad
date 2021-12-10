import 'package:bunyaad/Controller/controller.dart';
import 'package:bunyaad/Controller/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bunyaad/View/Widgets/CustomAppBar.dart';
import 'dart:ui';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  _AddServiceState createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  TextEditingController name = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController area = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController unit = new TextEditingController();
  String dropdownValue = 'box';
  String dropdownValue2= 'Product';
  bool enbl = false;

  @override
  Widget build(BuildContext context) {
    var ui;
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
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    height: 20,
                  ),
                  Row(
                    //header
                    children: [
                      Container(
                        child: Text("Create a Service", style: TextStyle(fontFamily: "Comfortaa", fontSize: 24, color: Colors.red.shade400)),
                        margin: EdgeInsets.fromLTRB(50, 20, 20, 20),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    height: 15,
                  ),
                  Padding(
                    //form
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                        child: Padding(
                          padding: EdgeInsets.all(50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                //name
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Name", style: TextStyle(fontFamily: "Comfortaa", fontSize: 14, fontStyle: FontStyle.italic)),
                                  SizedBox(
                                    width: 85,
                                  ),
                                  Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      textAlign: TextAlign.center,
                                      autofillHints: ["Cement", "Tiles", "Concrete"],
                                      style: TextStyle(fontFamily: "Comfortaa"),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                          ),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple))),
                                      controller: name,
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.grey,
                                    )),
                                    width: 450,
                                    height: 40,
                                  ),
                                  SizedBox(width: 150,),
                                  Text("Type", style: TextStyle(fontFamily: "Comfortaa", fontSize: 14),),
                                  SizedBox(width: 30,),
                                  DropdownButton<String>(
                                    value: dropdownValue2,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: TextStyle(color: Colors.red.shade400),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.red.shade400,),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue2 = newValue!;
                                        if(dropdownValue2 != 'Product'){
                                          dropdownValue = "hrs";}
                                          else{
                                            dropdownValue = 'box';
                                        }
                                      });
                                    },
                                    items: <String>['Product', 'Contracting', 'Construction', 'Designing'].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),);
                                    }).toList(),),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Description", style: TextStyle(fontFamily: "Comfortaa", fontSize: 14, fontStyle: FontStyle.italic)),
                                  SizedBox(
                                    width: 43,
                                  ),
                                  Container(
                                    child: TextFormField(
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      textAlign: TextAlign.center,
                                      autofillHints: ["Cement", "Tiles", "Concrete"],
                                      style: TextStyle(fontFamily: "Comfortaa"),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple))),
                                      controller: description,
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.grey,
                                    )),
                                    width: 1050,
                                    height: 200,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start, //Type
                                children: [
                                  Text("Unit", style: TextStyle(fontFamily: "Comfortaa", fontSize: 14, fontStyle: FontStyle.italic)),
                                  SizedBox(
                                    width: 43,
                                  ),
                                  DropdownButton(
                                      value: dropdownValue,
                                      icon: const Icon(Icons.arrow_downward),
                                      elevation: 16,
                                      style: const TextStyle(color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                          if (dropdownValue == 'custom'){
                                            enbl = true;
                                          }
                                          else{ enbl= false; }
                                          }
                                        );
                                      },
                                      items: <String>['kg','days', 'hrs', 'meters', 'tons', 'litres', 'box', 'carton', 'custom'].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList()),
                                  SizedBox(width: 60,),
                                  Text("Custom Unit", style: TextStyle(fontFamily: "Comfortaa", fontSize: 14, fontStyle: FontStyle.italic,)),
                                  SizedBox(width: 50,),
                                  Container(
                                      decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)
                                    ),
                                    child: TextFormField(
                                      enabled: enbl,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red.shade400),
                                          ),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple))),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontFamily: "Comfortaa"),
                                      controller: unit,
                                      textAlignVertical: TextAlignVertical.center,
                                    ),
                                    width: 80,
                                    height: 30,
                                  ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text("Price",style: TextStyle(fontFamily: "Comfortaa", fontStyle: FontStyle.italic),),
                                SizedBox(width: 30,),
                                Container(
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                  height: 30,
                                  width: 140,
                                  child: TextFormField(
                                    controller: price,
                                    decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red.shade400),
                                ),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple))),
                                    textAlignVertical: TextAlignVertical.center,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                  ),
                                )
                              ],),
                              SizedBox(height: 50,),
                              Row(children: [
                                imageField()
                              ],)
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(padding: EdgeInsets.only(right: 60),
                      child: ElevatedButton(style:
                      ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green.shade300)),
                          onPressed: () async {
                            await ServiceController.createService(area: "Karachi", category: dropdownValue2, unit: dropdownValue, name: name.text.toString(), price: int.parse(price.text), description: description.text.toString(), uid: "oyFVZhkdpecUgc7RF9NX9NhtiWl1");
                          },
                          child: Text("Save", style: TextStyle(fontFamily: "Comfortaa"),)))],),

                  SizedBox(height: 30,)
                ],
              )),
            )),
      ),
    );
  }
}

Widget nameField() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Service Name",
        style: TextStyle(
          color: Colors.black,
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
          keyboardType: TextInputType.name,
          autofillHints: ["Cement"],
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
          ),
          decoration: InputDecoration(
            // helperText: "Email",
            contentPadding: EdgeInsets.only(top: 14),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}

Widget TypeField() {
  String dropdownValue = 'Supply Product';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Service Type",
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
          child: DropdownButtonFormField<String>(
            value: dropdownValue,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {},
            items: <String>['Supply Product', 'Contracting service', 'Construction Service', 'Designing service'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ))
    ],
  );
}

Widget MinPriceField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Minimum Price",
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
          keyboardType: TextInputType.name,
          autofillHints: ["Cement"],
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            // helperText: "Email",
            contentPadding: EdgeInsets.only(top: 14),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}

Widget LocationField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Service Location",
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
          keyboardType: TextInputType.name,
          autofillHints: ["Cement"],
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            // helperText: "Email",
            contentPadding: EdgeInsets.only(top: 14),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}

Widget imageField() {
  return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red.shade400),
      ),
      onPressed: () async {
        await Controller.selectImageFile(uploadType: 1);
      },
      child: Text("Upload Image", style: TextStyle(fontFamily: "Comfortaa"),));
}
