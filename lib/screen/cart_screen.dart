import 'package:flutter/material.dart';
import 'package:flutter_application/provider/cart_provider.dart';
import 'package:flutter_application/widget/cart_item_widget.dart';
import 'package:flutter_application/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: buildSecondaryAppBar(context),
        body: cartProvider.carts.isEmpty
            ? Center(
                child: Text(
                'Empty cart',
                style: Theme.of(context).textTheme.headline1,
              ))
            : ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CartItemWidget(
                          product: cartProvider.carts.keys.toList()[index],
                          amount: cartProvider.carts.values.toList()[index]),
                    ),
                separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).dividerColor,
                    ),
                itemCount: cartProvider.carts.length),
        floatingActionButton: cartProvider.carts.isEmpty
            ? null
            : FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context)
                      .pop('The seller will contact you shortly');
                },
                label:
                    Text('Pay \$${cartProvider.getTotal().toStringAsFixed(2)}'),
              ),
      ),
    );
  }
}
