import 'package:flutter/material.dart';
import 'package:flutter_application/model/product.dart';
import 'package:flutter_application/provider/cart_provider.dart';
//import 'package:flutter_application/screen/product_screen.dart';
//import 'package:flutter_application/util/constants.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final int amount;

  const CartItemWidget({Key key, this.product, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 86,
                  height: 86,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(product.image, fit: BoxFit.contain),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Amount: $amount',
                    style: Theme.of(context).textTheme.bodyText1),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    product.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '\$' + (product.price * amount).toStringAsFixed(2),
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontSize: 16),
                  ),
                ),
                OutlinedButton(
                    //padding: EdgeInsets.symmetric(horizontal: 8),
                    //borderSide:
                    //    BorderSide(color: Theme.of(context).accentColor),
                    child: Text(
                      'Remove from cart'.toUpperCase(),
                      style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).accentColor, fontSize: 12),
                    ),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .removeFromCart(product);
                    })
              ],
            ),
          ),
        )
      ],
    );
  }
}
