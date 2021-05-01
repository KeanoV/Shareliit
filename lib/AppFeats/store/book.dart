import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharekiitstarter/AppFeats/store/bookmodel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sharekiitstarter/AppFeats/store/cart_screen.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  List<Data> dataList = [];
  bool searchState = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("Books");
    referenceData.once().then((DataSnapshot dataSnapShot) {
      dataList.clear();

      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;

      for (var key in keys) {
        Data data = new Data(
            values[key]['imgUrl'],
            values[key]['name'],
            values[key]['material'],
            values[key]['price'],
            values[key]['gradelevel'],
            values[key]['description'],
            key
            //key is the uploadid
            );
        dataList.add(data);
      }

      Timer(Duration(seconds: 1), () {
        setState(() {
          //
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Books"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: TextField(
                      onChanged: (text) {
                        SearchMethod(text);
                      },
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Search for a word",
                        contentPadding: const EdgeInsets.only(left: 24.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
      body: dataList.length == 0
          ? Center(
              child: Text(
              "No Data Available",
              style: TextStyle(fontSize: 30),
            ))
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (_, index) {
                return CardUI(
                    dataList[index].imgUrl,
                    dataList[index].name,
                    dataList[index].author,
                    dataList[index].price,
                    dataList[index].uploadid,
                    index);
              }),
    ));
  }

  Widget CardUI(String imgUrl, String name, String author, String price,
      String uploadId, int index) {
    return Card(
        elevation: 7,
        margin: EdgeInsets.all(15),
        color: Color(0xffff2fc3),
        child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(1.5),
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Image.network(
                imgUrl,
                fit: BoxFit.cover,
                height: 100,
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1,
              ),
              Text("material:- $author"),
              SizedBox(
                height: 1,
              ),
              Center(
                  child: Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 5, height: 30),
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black45),
                          onPressed: () {
                            checkitem(dataList[index].uploadid, context);
                          },
                          child: Text('Buy')),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(price,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
              ]))
            ])));
  }

  void SearchMethod(String text) {
    DatabaseReference searchRef =
        FirebaseDatabase.instance.reference().child("Books");
    searchRef.once().then((DataSnapshot snapShot) {
      dataList.clear();
      var keys = snapShot.value.keys;
      var values = snapShot.value;

      for (var key in keys) {
        Data data = new Data(
            values[key]['imgUrl'],
            values[key]['name'],
            values[key]['author'],
            values[key]['price'],
            values[key]['price'],
            values[key]['price'],
            values[key]['price']
            //key is the uploadid
            );
        if (data.name.contains(text)) {
          dataList.add(data);
        }
      }
      Timer(Duration(seconds: 6), () {
        setState(() {
          //
        });
      });
    });
  }
}
