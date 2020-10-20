import 'package:beli_yuk/data/response/login_entity.dart';
import 'package:beli_yuk/ui/PageKategori.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'PageLogin.dart';
import 'PageProduk.dart';

class PageHome extends StatefulWidget {
  LoginEntity user;

  PageHome({this.user});

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  LoginEntity user;

  @override
  void initState() {
    user = widget.user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          welcomeText(),
          listProdukBtn(),
          listKategoriBtn(),
          LogOutBtn()
        ],
      ),
    );
  }

  Widget welcomeText() {
    var text = "";
    if (user != null) {
      text = "Selamat Datang ${user.nama}";
    }
    return Text(text);
  }

  Widget listProdukBtn() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        "List Produk ",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => PageProduk(),
        ));
      },
    );
  }

  Widget listKategoriBtn() {
    return RaisedButton(
      color: Colors.green,
      child: Text(
        "List Kategori ",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => PageKategori(),
        ));
      },
    );
  }

  Widget LogOutBtn() {
    return RaisedButton(
      color: Colors.redAccent,
      child: Text(
        "LogOut ",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        removeDataPref();
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => PageLogin(),
        ));
      },
    );
  }

  String lastLoginKeyEmail = "key last login email";
  String lastLoginKeyPassword = "key last login";

  void removeDataPref() async {
    print("removeDataPref");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(lastLoginKeyEmail, null);
    sharedPreferences.setString(lastLoginKeyPassword, null);
  }
}
