import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("About"),
        ),
        body: Center(
            child: Text("About Page"),
        ));
  }
}
