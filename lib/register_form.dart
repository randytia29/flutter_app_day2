import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _agama = "Islam";
  List<String> agama = [
    "Islam",
    "Kristen Protestan",
    "Kristen Katholik",
    "Budha",
    "Hindu"
  ];
  String _jk = "";
  bool hidenPass = true;

  showHidden() {
    setState(() {
      hidenPass = !hidenPass;
    });
  }

  pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Register Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                  hintText: "input nama",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "input email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: alamatController,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "input alamat",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: passwordController,
              obscureText: hidenPass,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon((hidenPass)
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: showHidden),
                  hintText: "input password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Pilih Agama"),
                DropdownButton(
                    value: _agama,
                    items: agama.map((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (String value) {
                      pilihAgama(value);
                    })
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                      value: "Laki-laki",
                      groupValue: _jk,
                      activeColor: Colors.red,
                      title: Text("Laki-laki"),
                      onChanged: (String value) {
                        pilihJk(value);
                      }),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                      value: "Perempuan",
                      groupValue: _jk,
                      activeColor: Colors.red,
                      title: Text("Perempuan"),
                      onChanged: (String value) {
                        pilihJk(value);
                      }),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Informasi"),
                        content: SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          child: Column(
                            children: <Widget>[
                              Text("nama anda: " + namaController.text),
                              Text("email anda: " + emailController.text),
                              Text("alamat anda: " + alamatController.text),
                              Text("password anda: " + passwordController.text),
                              Text("agama anda: " + _agama),
                              Text("Jenis Kelamin anda: " + _jk)
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ],
                      );
                    });
              },
              child: Text("SUBMIT"),
            )
          ],
        ),
      ),
    );
  }
}
