import 'package:flutter/material.dart';
import 'package:sharekiitstarter/AppFeats/store/cart_items.dart';
import 'package:sharekiitstarter/AppFeats/store/cart_model.dart';
import 'package:sharekiitstarter/CustomEdits/Container.dart';
import 'package:provider/provider.dart';

class CheckoutCart extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget build(BuildContext context) {
  final cart = Provider.of<Cart>(context);
  return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sharekiit",
              style: TextStyle(fontSize: 30, color: Colors.amber),
            ),
            Text(
              "CheckOut",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ShadowContainer(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (ctx, i) => CartPdt(
                          cart.items.values.toList()[i].id,
                          cart.items.keys.toList()[i],
                          cart.items.values.toList()[i].price,
                          cart.items.values.toList()[i].quantity,
                          cart.items.values.toList()[i].title)),
                ),
              ],
            ),
          )));
}

void checkitem(String id, BuildContext context) {
  addtocart(id, context);
}

void addtocart(String id, BuildContext context) {}
