import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailBuah extends StatelessWidget {
  final nJudul;
  final nGambar;
  final nKeterangan;

  DetailBuah({this.nJudul, this.nGambar, this.nKeterangan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(nJudul),
          backgroundColor: Colors.green[800],
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              "images/" + nGambar,
              fit: BoxFit.cover,
            ),
            BagianNama(nama: nJudul),
            BagianIcon(),
            BagianKeterangan(mKeterangan: nKeterangan)
          ],
        ));
  }
}

class BagianNama extends StatelessWidget {
  final nama;

  BagianNama({this.nama});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20),
                ),
                Text(
                  nama + "@gmail.com",
                  style: TextStyle(fontSize: 17, color: Colors.green),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 30,
                color: Colors.green,
              ),
              Text(
                "12",
                style: TextStyle(fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconTeks(iconData: Icons.call, teks: "Call"),
          IconTeks(iconData: Icons.message, teks: "Message"),
          IconTeks(iconData: Icons.photo, teks: "Photo")
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  final iconData;
  final teks;

  IconTeks({this.iconData, this.teks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: <Widget>[
        Icon(
          iconData,
          size: 20,
          color: Colors.green,
        ),
        Text(
          teks,
          style: TextStyle(fontSize: 12, color: Colors.green),
        )
      ],
    ));
  }
}

class BagianKeterangan extends StatelessWidget {
  final mKeterangan;

  BagianKeterangan({this.mKeterangan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        mKeterangan,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
