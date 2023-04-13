import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
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
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Login"),
                    style: TextButton.styleFrom(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
