import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  Timer _debounce;
  TextEditingController _controller = TextEditingController();

  StreamController _streamController;
  Stream _stream;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
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
                    child: TextFormField(
                      onChanged: (String text) {
                        if (_debounce?.isActive ?? false) _debounce.cancel();
                        _debounce =
                            Timer(const Duration(milliseconds: 1000), () {
                          _search();
                        });
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
                  onPressed: () {
                    _search();
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: SizedBox(
                height: 300.0,
                width: 500.0,
                child: Carousel(
                  images: [
                    ExactAssetImage("assets/tannies.jpg"),
                    ExactAssetImage("assets/kookie.jpg")
                  ],
                )),
          ),
          ShadowContainer(
            child: Text(
                "teagg ukgciytnhbouybfhobuhv ytctf gvkyc hvytd vhl jhv t hvlig y vljb hk';jv kyti ytv kjblhvuuhv;blhjvhvkhjjv jhgcitvk hhvh lv y v hv\n hgvytcv gcurxu g hg yuc lhjvkgc uxv buy i tci ytgvlkhv oy fgvkh h tdrxc gvh iyrc gbkkbugctr xgv u hvit  fxut r"),
          )
        ],
      ),
    ));
  }
}
