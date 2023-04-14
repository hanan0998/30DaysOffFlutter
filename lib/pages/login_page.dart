import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        // the best method to make a app responsive is to add it into singlechildscrollview
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/loginImage.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    //using textformfield instead of testfield
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Username"),
                        hintText: "Enter username",
                      ),
                    ),
                    TextFormField(
                      // we don't want that password will show so we use this
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: "Enter password",
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // to jump on the homepage and we are using navgator.pushNamed
                        // to push page by its name
                        Navigator.pushNamed(context, MyRoutes.homePage);
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(120, 35)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
