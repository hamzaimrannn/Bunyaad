import 'package:bunyaad/View/Model/view_variables.dart';
import 'package:flutter/material.dart';

enum MenuOption1 {Profile, Settings, Logout}

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption1>(
        icon: Icon(Icons.account_circle),
        itemBuilder: (BuildContext context){
          return <PopupMenuEntry<MenuOption1>>[
            PopupMenuItem(child: Text("Profile"),value: MenuOption1.Profile),
            PopupMenuItem(child: Text("Settings"), value: MenuOption1.Settings),
            PopupMenuItem(child: Text("Logout"), value: MenuOption1.Logout)
          ];
        });
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  TabBar tabBar;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.tabBar
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(150.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: tabBar,
      title: Text(title, style: ViewVariables.textStyleTitle,),
      actions: <Widget>[
        Container(
          width: 350,
          padding: EdgeInsets.fromLTRB(0, 60, 10, 0),
          child: TextField(
            style: TextStyle(fontSize: 9, height: 2, fontFamily: 'Comfortaa'),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                isDense: true,
                hintText: "Search",
                fillColor: Colors.white,
                filled: true
            ),
          ),),
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 25,
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green[300],
          ),
          child: GestureDetector(
              onTap: ()=> {},
              child: Text("Search", style: TextStyle(color: Colors.white, backgroundColor: Colors.green[300] ),)
          ),
        ),
        Container(
          width: 600,
          child: ButtonBar(
            buttonPadding: EdgeInsets.all(20),
            children: [
              TextButton(onPressed: ()=> {}, child: Text("Request Service", style: TextStyle(fontFamily: "Comfortaa", fontSize: 12, color: Colors.white),)),
              TextButton(onPressed: ()=> {}, child: Text("Cost Estimator",  style: TextStyle(fontFamily: "Comfortaa", fontSize: 12, color: Colors.white),)),
              TextButton(onPressed: ()=> {}, child: Text("Forecasting",  style: TextStyle(fontFamily: "Comfortaa", fontSize: 12, color: Colors.white),)),
              TextButton(onPressed: () => {}, child: Text("Messages",  style: TextStyle(fontFamily: "Comfortaa", fontSize: 12, color: Colors.white),))
            ],
          ),
        ),
        PopupMenu()
      ],
      toolbarHeight: 90,
      titleSpacing: 15,
      elevation: 15,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )
        ),
      ),);
  }
}
