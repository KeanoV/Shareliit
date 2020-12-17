import 'package:flutter/material.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:sharekiitstarter/Model/bookModel.dart';
import 'package:sharekiitstarter/Screens/root.dart';

class EachBook extends StatelessWidget {
  final BookModel book;
  final String groupId;

  void _goToReviewHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OurRoot(),
      ),
    );
  }

  EachBook({this.book, this.groupId});
  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: Column(
        children: [
          Text(
            book.name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            book.author,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text("Reviews"),
            onPressed: () => _goToReviewHistory(context),
          )
        ],
      ),
    );
  }
}
