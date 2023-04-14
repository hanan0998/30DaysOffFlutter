import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
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
                "Welcome $name",
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
                      // take the name from textfield and assign to name
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
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
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        // using await and sync to delay for 1 second and then move to the homepage
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homePage);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: changeButton ? 50 : 120,

                        // to align the text in center
                        alignment: Alignment.center,
                        // using this condition so that the login text will
                        // into icon when button is pressed
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            // to add shape to container
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8)),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // to jump on the homepage and we are using navgator.pushNamed
                    //     // to push page by its name
                    //     Navigator.pushNamed(context, MyRoutes.homePage);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(120, 35)),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
