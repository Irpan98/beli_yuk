import 'dart:convert';

import 'package:beli_yuk/ui/PageDetailProduk.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../IpServer.dart';

class PageDetailKategori extends StatefulWidget {
  List list;
  int index;

  PageDetailKategori({this.list, this.index});

  @override
  _PageDetailKategoriState createState() => _PageDetailKategoriState();
}

class _PageDetailKategoriState extends State<PageDetailKategori> {
  @override
  Widget build(BuildContext context) {
    var id = widget.list[widget.index]['id'];
    Future<List> getData() async {
      final response = await http.post(
          "http://$IP_SERVER/beli_yuk_flutter/getProdukByKategori.php",
          body: {"id": id});

      return json.decode(response.body);
    }

    return Scaffold(
      appBar: new AppBar(
        title: Text("List Produk"),
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
                      DetailProduk(list: list, index: i),
                ));
              },
              child: new Card(
                color: Colors.white,
                child: new ListTile(
                  title: new Text(list[i]['nama']),
                  subtitle: Text(
                    "Rp " + list[i]['harga'],
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image.network(
                    list[i]['photoPath'],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
