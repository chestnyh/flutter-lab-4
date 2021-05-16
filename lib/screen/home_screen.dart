import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application/provider/product_provider.dart';
import 'package:flutter_application/routes.dart';
import 'package:flutter_application/screen/navigation_drawer.dart';
import 'package:flutter_application/widget/categories_carusel_widgert.dart';
import 'package:flutter_application/widget/custom_app_bar.dart';
import 'package:flutter_application/widget/info_flushbar.dart';
import 'package:flutter_application/widget/product_item_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .loadProductsFromBackend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productList = Provider.of<ProductProvider>(context).products;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildRootAppBar(context),
      drawer: NavigationDrawer(),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: CategoriesCarouselWidget(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22),
          sliver: productList.isNotEmpty
              ? SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 200 / 262,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ProductItemWidget(product: productList[index]);
                    },
                    childCount: productList.length,
                  ),
                )
              : SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator())),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.home_filled, color: Theme.of(context).accentColor),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,
                  color: Theme.of(context).accentColor),
              label: 'Profile')
        ],
        onTap: (index) {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () async {
          var result = await Navigator.of(context).pushNamed(cartPageRoute);

          if (result != null) {
            showSimpleFlushbar(context, result.toString());
          }
        },
        tooltip: 'Increment',
        child: new Icon(Icons.shopping_basket,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
