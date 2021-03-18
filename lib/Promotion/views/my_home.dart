import 'package:Shopper/Notifications/Notifications.dart';
import 'package:Shopper/Promotion/data/data.dart';
import 'package:Shopper/Promotion/models/categorie_model.dart';
import 'package:Shopper/Promotion/models/product_model.dart';
import 'package:Shopper/Promotion/models/trending_productmodel.dart';
import 'package:Shopper/Promotion/resources/colors.dart';
import 'package:Shopper/Promotion/views/banner.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TrendingProductModel> trendingProducts = new List();
  List<ProductModel> products = new List();
  List<CategorieModel> categories = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    trendingProducts = getTrendingProducts();
    products = getProducts();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Promotion"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BannerSlider2(),

              /// Search Bar

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Top Product By SHOPPER",
                  style: TextStyle(color: Colors.black87, fontSize: 22),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 22),
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategorieTile(
                        categorieName: categories[index].categorieName,
                        imgAssetPath: categories[index].imgAssetPath,
                        color1: categories[index].color1,
                        color2: categories[index].color2,
                      );
                    }),
              ),

              /// Best Selling
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Best Selling",
                      style: TextStyle(color: Colors.black87, fontSize: 22),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text("This week")
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                height: 240,
                padding: EdgeInsets.only(left: 22),
                child: ListView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        priceInDollars: products[index].priceInDollars,
                        productName: products[index].productName,
                        imgUrl: products[index].imgUrl,
                        noOfRating: products[index].noOfRating,
                      );
                    }),
              ),

              /// Top categorie
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingTile extends StatelessWidget {
  final String productName;
  final String storename;
  final String image;
  final String noOfRating;
  final int priceInDollars;

  TrendingTile(
      {this.productName,
      this.storename,
      this.image,
      this.noOfRating,
      this.priceInDollars});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      margin: EdgeInsets.only(right: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 15.0,
            color: Colors.black87.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  image,
                  height: 100,
                  width: 190,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 25,
                  width: 50,
                  margin: EdgeInsets.only(left: 5, top: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(colors: [
                        const Color(0xff8EA2FF).withOpacity(0.5),
                        const Color(0xff557AC7).withOpacity(0.5)
                      ])),
                  child: Text(
                    "$priceInDollars",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productName,
                  style: TextStyle(color: Colors.black87, fontSize: 19),
                ),
                Text(
                  storename,
                  style: TextStyle(color: textGrey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "($noOfRating)",
                      style: TextStyle(color: textGrey, fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final int priceInDollars;
  final String productName;
  final String imgUrl;
  final String noOfRating;

  ProductTile(
      {this.priceInDollars, this.imgUrl, this.productName, this.noOfRating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  imgUrl,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 25,
                  width: 45,
                  margin: EdgeInsets.only(left: 8, top: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(colors: [
                        const Color(0xff8EA2FF).withOpacity(0.5),
                        const Color(0xff557AC7).withOpacity(0.5)
                      ])),
                  child: Text(
                    "$priceInDollars",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Text(productName),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                "($noOfRating)",
                style: TextStyle(color: textGrey, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String categorieName;
  final String imgAssetPath;
  final String color1;
  final String color2;

  CategorieTile(
      {this.imgAssetPath, this.color2, this.color1, this.categorieName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 65,
            width: 110,
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(int.parse(color1)),
                  Color(int.parse(color2))
                ]),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Container(
                child: Image.asset(
              imgAssetPath,
            )),
          ),
          SizedBox(
            height: 8,
          ),
          Text(categorieName),
        ],
      ),
    );
  }
}
