import 'package:flutter/material.dart';
import 'package:flutterappday2/detail_search.dart';

class SearchListView extends StatefulWidget {
  @override
  _SearchListViewState createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
  TextEditingController etSearch = new TextEditingController();
  bool firstSearch = true;
  String query = "";
  List<String> dataList;
  List<String> filterList;

  @override
  void initState() {
    super.initState();
    dataList = List<String>();
    dataList = [
      "Elephant",
      "Snake",
      "Cats",
      "Dog",
      "Orion",
      "Bootle",
      "Boomerang",
      "Eagle",
      "Laptop",
      "Butterfly",
      "Book",
      "Water",
      "Handphone"
    ];
    dataList.sort();
    print(dataList);
  }

  _SearchListViewState() {
    etSearch.addListener(() {
      if (etSearch.text.isEmpty) {
        setState(() {
          firstSearch = true;
          query = "";
        });
      } else {
        setState(() {
          firstSearch = false;
          query = etSearch.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Search Listview"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: <Widget>[
            _createdSearchView(),
            firstSearch ? createdListView() : performSearch()
          ],
        ),
      ),
    );
  }

  Widget _createdSearchView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: TextField(
        controller: etSearch,
        decoration: InputDecoration(
            hintText: "Search", hintStyle: TextStyle(color: Colors.green)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget createdListView() {
    return Flexible(
        child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailList(
                                detail: dataList[index],
                              )));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Text(dataList[index]),
                  ),
                ),
              );
            }));
  }

  Widget performSearch() {
    filterList = List<String>();
    for (int i = 0; i < dataList.length; i++) {
      var item = dataList[i];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return createdFilterList();
  }

  Widget createdFilterList() {
    return Flexible(
        child: ListView.builder(
            itemCount: filterList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailList(
                                detail: dataList[index],
                              )));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Text(dataList[index]),
                  ),
                ),
              );
            }));
  }
}
