import 'package:flutter/material.dart';
import 'package:flutterappday2/detail_buah.dart';

class CustomeGridview extends StatefulWidget {
  @override
  _CustomeGridviewState createState() => _CustomeGridviewState();
}

class _CustomeGridviewState extends State<CustomeGridview> {
  List<Container> daftarBuah = List();
  var deskBuah = [
    {
      "nama": "Buah Anggur",
      "gambar": "gambar1.jpeg",
      "keterangan":
          "Ada banyak variasi tulisan Lorem Ipsum yang tersedia, tapi kebanyakan sudah mengalami perubahan bentuk, entah karena unsur humor atau kalimat yang diacak hingga nampak sangat tidak masuk akal. Jika anda ingin menggunakan tulisan Lorem Ipsum, anda harus yakin tidak ada bagian yang memalukan yang tersembunyi di tengah naskah tersebut."
    },
    {
      "nama": "Buah Apel",
      "gambar": "gambar2.jpg",
      "keterangan":
          "Tidak seperti anggapan banyak orang, Lorem Ipsum bukanlah teks-teks yang diacak. Ia berakar dari sebuah naskah sastra latin klasik dari era 45 sebelum masehi, hingga bisa dipastikan usianya telah mencapai lebih dari 2000 tahun. Richard McClintock, seorang professor Bahasa Latin dari Hampden-Sidney College di Virginia, mencoba mencari makna salah satu kata latin yang dianggap paling tidak jelas, yakni consectetur, yang diambil dari salah satu bagian Lorem Ipsum. Setelah ia mencari maknanya di di literatur klasik, ia mendapatkan sebuah sumber yang tidak bisa diragukan. Lorem Ipsum berasal dari bagian 1.10.32 dan 1.10.33 dari naskah de Finibus Bonorum et Malorum (Sisi Ekstrim dari Kebaikan dan Kejahatan) karya Cicero, yang ditulis pada tahun 45 sebelum masehi. BUku ini adalah risalah dari teori etika yang sangat terkenal pada masa Renaissance. Baris pertama dari Lorem Ipsum, Lorem ipsum dolor sit amet.., berasal dari sebuah baris di bagian 1.10.32."
    },
    {
      "nama": "Buah Naga",
      "gambar": "gambar3.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "nama": "Buah Duren",
      "gambar": "gambar4.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "nama": "Buah Kelengkeng",
      "gambar": "gambar5.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "nama": "Buah Markisa",
      "gambar": "gambar6.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "nama": "Buah Nanas",
      "gambar": "gambar7.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "nama": "Buah Pisang",
      "gambar": "gambar8.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "nama": "Buah Pear",
      "gambar": "gambar9.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "nama": "Buah Kiwi",
      "gambar": "gambar10.jpg",
      "keterangan": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimenbook. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    }
  ];

  _buildListBuah() async {
    for (var i = 0; i < deskBuah.length; i++) {
      final data = deskBuah[i];
      final gambar = data["gambar"];
      final judul = data["nama"];
      final keterangan = data["keterangan"];
      daftarBuah.add(Container(
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailBuah(
                  nJudul: judul,
                  nGambar: gambar,
                  nKeterangan: keterangan,
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "images/" + gambar,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  judul,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[800]),
                )
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _buildListBuah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Custome Gridview"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarBuah,
      ),
    );
  }
}
