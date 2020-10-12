import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterappday2/contact.dart';
import 'package:flutterappday2/contact_service.dart';
import 'package:intl/intl.dart';

class InputSelection extends StatefulWidget {
  @override
  _InputSelectionState createState() => _InputSelectionState();
}

class _InputSelectionState extends State<InputSelection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  List<String> _colors = <String>["", "red", "green", "blue", "orange"];
  String _color = "";
  TextEditingController _controller = new TextEditingController();
  Contact newContact = new Contact();

  Future<Null> _chooseDate(
      BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);
    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());
    if (result == null) return;
    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }

  bool isValidateDate(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  bool isValidateEmail(String input) {
    final RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regExp.hasMatch(input);
  }

  showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  _submitForm() {
    final FormState form = _key.currentState;
    if (!form.validate()) {
      showMessage("Form is not valid!, please review and correct");
    } else {
      form.save();
      print("Form save called, newContact is now up to date");
      print("Name :" + newContact.name);
      print("dob : ${newContact.dob}");
      print("Email :" + newContact.email);
      print("Favorite Color " + newContact.favoriteColor);
      print("=========================================");
      print("Submitting to back end");
      var contactService = new ContactService();
      contactService.createAccount(newContact).then((value) {
        showMessage("new contact create for ${value.name}!", Colors.blue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Input Selection"),
      ),
      body: SafeArea(
        child: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Enter your first and last name",
                    labelText: "name"),
                inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                validator: (val) => val.isEmpty ? "name is required" : null,
                onSaved: (val) => newContact.name = val,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: "Enter your date of birth",
                        labelText: "dob"),
                    controller: _controller,
                    validator: (val) =>
                        isValidateDate(val) ? null : "Not a valid date",
                    onSaved: (val) => newContact.dob = convertToDate(val),
                  )),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {
                      _chooseDate(context, _controller.text);
                    },
                  )
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter a email address",
                    labelText: "email"),
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
                validator: (val) =>
                    isValidateEmail(val) ? null : "Please enter a valid email",
                onSaved: (val) => newContact.email = val,
              ),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        icon: Icon(Icons.color_lens),
                        labelText: "color",
                        errorText: state.hasError ? state.errorText : null),
                    isEmpty: _color == "",
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            value: _color,
                            items: _colors.map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (String value) {
                              newContact.favoriteColor = value;
                              _color = value;
                              state.didChange(value);
                            })),
                  );
                },
                validator: (val) {
                  return val != "" ? null : "please select a color";
                },
              ),
              Container(
                padding: EdgeInsets.only(left: 40, top: 20),
                child: RaisedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: Text("SUBMIT"),
                ),
              )
            ],
          ),
        ),
        top: false,
        bottom: false,
      ),
    );
  }
}
