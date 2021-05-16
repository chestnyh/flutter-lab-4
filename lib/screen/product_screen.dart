import 'package:flutter/material.dart';
import 'package:flutter_application/model/product.dart';
import 'package:flutter_application/provider/cart_provider.dart';
import 'package:flutter_application/util/constants.dart';
import 'package:flutter_application/widget/custom_app_bar.dart';
import 'package:flutter_application/widget/info_flushbar.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildSecondaryAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMainSection(context),
            buildDescriptionSection(context)
          ],
        ),
      ),
    );
  }

  Widget buildMainSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 160,
                height: 160,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                      tag: Constants.getHeroTag(widget.product.id),
                      child: Image.network(widget.product.image,
                          fit: BoxFit.contain)),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    widget.product.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(categoryValues.reverse[widget.product.category],
                      style: Theme.of(context).textTheme.headline4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    '\$' + widget.product.price.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Buy Now'.toUpperCase(),
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: (){
                      Provider.of<CartProvider>(context, listen: false).addToCart(widget.product);
                      showAddToCartInfoFlushbar(context);
                    })
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildDescriptionSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text('Description',
                style: Theme.of(context).textTheme.headline6),
          ),
          Text(widget.product.description,
              style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
    );
  }
}
