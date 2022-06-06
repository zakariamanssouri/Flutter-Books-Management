import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer_item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 50,
              ),
              SizedBox(height: 10),
              Text("bibliothèque publique"),
            ],
          )),
          DrawerItem("Home", "/", Icon(Icons.home)),
          DrawerItem("Livres", "/Livres", Icon(Icons.book)),
          DrawerItem("Adhrents", "/Adhrents",
              Icon(Icons.supervised_user_circle)),
          DrawerItem("About", "/About", Icon(Icons.error)),
        ],
      ),
    );
  }
}
