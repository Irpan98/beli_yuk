import 'dart:convert';

import 'package:beli_yuk/data/response/login_entity.dart';
import 'package:beli_yuk/utils/ViewUtils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../IpServer.dart';
import 'PageHome.dart';
import 'PageRegister.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final _keyForm = GlobalKey<FormState>();

  String email, pass;

  submitDataLogin() async {
    final responseData = await http.post(
        "http://$IP_SERVER/beli_yuk_flutter/login.php",
        body: {"email": email, "password": pass});

    final data = jsonDecode(responseData.body);
    int value = data['value'];

    var getUser = LoginEntity().fromJson(data);

    if (value == 1) {
      safeDataPref(email, pass);

      ViewUtils().showToast("Berhasil Login");
      Navigator.push(
          // context, MaterialPageRoute(builder: (context) => PageHome(user)));
          context,
          MaterialPageRoute(
              builder: (context) => PageHome(
                    user: getUser,
                  )));
    } else {
      ViewUtils().showToast("Password atau Email Salah");
    }
  }

  checkForm() {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      submitDataLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      backgroundColor: Colors.blueGrey,
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: Colors.white),
              ),
              TextFormField(
                  onSaved: (value) => email = value,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                  )),
              TextFormField(
                onSaved: (value) => pass = value,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print("Login Clicked");
                      setState(() {
                        checkForm();
                      });
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  print("register clicked");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageRegister()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String lastLoginKeyEmail = "key last login email";
  String lastLoginKeyPassword = "key last login";

  void safeDataPref(String email, String password) async {
    print("safeDataPref");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(lastLoginKeyEmail, email);
    sharedPreferences.setString(lastLoginKeyPassword, password);
  }

  @override
  void initState() {
    loadDataPref();
    super.initState();
  }

  void loadDataPref() async {
    print("loadDataPref");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var notFirstTime = sharedPreferences.getString(lastLoginKeyEmail);
    if (notFirstTime != null) {
      email = sharedPreferences.getString(lastLoginKeyEmail);

      pass = sharedPreferences.getString(lastLoginKeyPassword);

      submitDataLogin();
    }
  }
}
