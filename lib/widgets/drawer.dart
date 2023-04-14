import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            // it is the header which contain user name and email
            DrawerHeader(
              // removing padding to remove space from left, right, bottom, and top
              padding: EdgeInsets.zero,
              // adding user account details widget
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Hanan Hanan",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("TowerTechnologies89@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/MyPic.jpeg'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Contact",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
