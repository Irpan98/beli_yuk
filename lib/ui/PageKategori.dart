import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../IpServer.dart';
import 'PageDetailKategori.dart';

class PageKategori extends StatefulWidget {
  @override
  _PageKategoriState createState() => _PageKategoriState();
}

class _PageKategoriState extends State<PageKategori> {
  @override
  Widget build(BuildContext context) {
    Future<List> getData() async {
      final response =
          await http.get("http://$IP_SERVER/beli_yuk_flutter/getKategori.php");

      return json.decode(response.body);
    }

    return Scaffold(
      appBar: new AppBar(
        title: Text("List Kategori"),
        backgroundColor: Colors.green,
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: List == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PageDetailKategori(list: list, index: i),
                ));
              },
              child: new Card(
                color: Colors.white,
                child: new ListTile(
                  title: new Text(list[i]['Kategori']),
                  // subtitle: Text(
                  //   "Rp " + list[i]['harga'],
                  //   style: TextStyle(
                  //       color: Colors.redAccent,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),
                ),
              ),
            ),
          );
        });
  }
}
