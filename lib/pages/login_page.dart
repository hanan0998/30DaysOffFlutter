import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  // making a form key to identify any where globally
  final _formKey = GlobalKey<FormState>();
  // making function to paste all the onTap Code here ( making code clean)
  MoveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      // using await and sync to delay for 1 second and then move to the homepage
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homePage);
      setState(() {
        changeButton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        // the best method to make a app responsive is to add it into singlechildscrollview
        child: SingleChildScrollView(
          // rapping the whole page into form
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/loginImage2.png',
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username is required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        // we don't want that password will show so we use this
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Text("Password"),
                          hintText: "Enter password",
                        ),
                        // using validator so that field will not be empty
                        validator: (value) {
                          if (value == null) {
                            return "Password is required";
                          } else if (value != null && value.length < 6) {
                            return "Password lenght must be atleast 6";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () => MoveToHome(context),
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
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     // to add shape to container
                            //     // borderRadius:
                            //     //     BorderRadius.circular(changeButton ? 50 : 8),
                            //         ),
                          ),
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
          ),
        ));
  }
}
