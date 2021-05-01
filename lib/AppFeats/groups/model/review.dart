import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:sharekiitstarter/Model/UserModel.dart';
import 'package:sharekiitstarter/Model/groupmodel.dart';

class Review extends StatefulWidget {
  final GroupModel groupModel;

  Review({@required this.groupModel});
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final reviewKey = GlobalKey<ScaffoldState>();
  TextEditingController _reviewController = TextEditingController();
  int _dropdownValue;
  UserModel _authModel;

  @override
  void didChangeDependencies() {
    _authModel = Provider.of<UserModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: reviewKey,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ShadowContainer(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Rate book 1-10:"),
                      DropdownButton<int>(
                        value: _dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor),
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).canvasColor,
                        ),
                        onChanged: (int newValue) {
                          setState(() {
                            _dropdownValue = newValue;
                          });
                        },
                        items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _reviewController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Add A Review",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: Text(
                          "Add Review",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
