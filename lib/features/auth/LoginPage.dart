import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:karma/common/widgets/constanst.dart';
import 'package:karma/features/drives/drives_page.dart';
import 'package:karma/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController interestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    FlutterLogo(
                      size: 150,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "LOGIN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                decoration: new BoxDecoration(
                  color: ThemeColors.primary,
                  borderRadius: new BorderRadius.vertical(
                      bottom: new Radius.elliptical(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.width / 2.5)),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Name",
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "E-mail",
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                            hintText: "Location",
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 20),
                        child: TextFormField(
                          controller: interestController,
                          decoration: InputDecoration(
                            hintText: "interest",
                            fillColor: Colors.grey[200],
                            border: InputBorder.none,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: Colors.grey[200],
                            filled: true,
                            border: InputBorder.none,
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {}, child: Text("Forget Password?"))
                        ],
                      ),
                      // Spacer(),
                      TextButton(
                          child: Text("Login", style: TextStyle(fontSize: 14)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 15)),
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.lightGreen),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side:
                                          BorderSide(color: Colors.lightGreen)))),
                          onPressed: () async {
                            try {
                              Response response = await post(
                                  Uri.parse("${Constants.baseUrl}login"),
                                  body: {
                                    "email": emailController.text,
                                    "password": passwordController.text,
                                  });

                              final jsonRes = jsonDecode(response.body);

                              if (jsonRes['token'] != null) {
                                final _pref =
                                    await SharedPreferences.getInstance();
                                await Future.wait([
                                  _pref.setString('token', jsonRes['token']),
                                  _pref.setString('name', nameController.text),
                                  _pref.setString(
                                      'email', emailController.text),
                                  _pref.setString(
                                      'location', locationController.text),
                                  _pref.setString(
                                      'interest', interestController.text),
                                  _pref.setString(
                                      'phone', phoneController.text),
                                ]);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DrivesPage(),
                                    ));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text("Invalid email or password"),
                                  ),
                                );
                              }
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("oops Some error occured"),
                                ),
                              );
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Not a memeber yet? "),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Click Here",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
