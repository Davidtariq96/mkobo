import 'package:flutter/material.dart';
import 'package:mkobo_microbank/register_page.dart';
import 'models/login_model_request.dart';
import 'services/api_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final String email;
  late final String password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.teal.shade600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome, please login!",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 30),
                      child:
                          Text("email", style: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "enter your email",
                            labelText: "email",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20, 10, 20, 10)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 30),
                      child: Text("password",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "enter your password",
                            labelText: "password",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20, 10, 20, 10)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LoginRequest model =
                                LoginRequest(email: email, password: password);
                            APIService.login(model).then((result) => () {
                                  if (result) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()),
                                    );
                                  }
                                });
                          }
                        },
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
