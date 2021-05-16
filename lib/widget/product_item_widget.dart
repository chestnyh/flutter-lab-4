import 'package:flutter/material.dart';
import 'package:flutter_application/model/product.dart';
import 'package:flutter_application/provider/cart_provider.dart';
import 'package:flutter_application/provider/theme_provider.dart';
import 'package:flutter_application/screen/product_screen.dart';
// import 'package:flutter_application/theme/theme.dart';
import 'package:flutter_application/util/constants.dart';
import 'package:flutter_application/widget/info_flushbar.dart';
import 'package:provider/provider.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;

  const ProductItemWidget({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(product: product)),
        );
      },
      child: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 110,
                  height: 110,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: Constants.getHeroTag(product.id),
                      child: Image.network(product.image, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 12, right: 12),
              child: Text(product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2),
            ),
            InkWell(
              onTap: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(product);
                showAddToCartInfoFlushbar(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(' shop now '.toUpperCase(),
                    style: Theme.of(context).textTheme.headline3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
