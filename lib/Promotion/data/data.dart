import 'package:Shopper/Promotion/models/categorie_model.dart';
import 'package:Shopper/Promotion/models/product_model.dart';
import 'package:Shopper/Promotion/models/trending_productmodel.dart';

List<TrendingProductModel> getTrendingProducts() {
  List<TrendingProductModel> trendingProducts =
      new List<TrendingProductModel>();
  TrendingProductModel productModel = new TrendingProductModel();

  //1
  productModel.storename = "Adidas Runner";
  productModel.productName = "Adidas";
  productModel.noOfRating = "จากปกติ 7400";
  productModel.priceInDollars = 3990;
  productModel.image = "assets/imgPromotion/Adidas/adidas4.png";

  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();

  //2
  productModel.storename = "Adidas";
  productModel.productName = "Adidas";
  productModel.noOfRating = "ราคาปกติ4990";
  productModel.priceInDollars = 2590;
  productModel.image = "assets/imgPromotion/Adidas/adidas2.png";

  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();

  //3
  productModel.storename = "Nike Excee1";
  productModel.productName = "Nike";
  productModel.noOfRating = "จากปกติ 5980";
  productModel.priceInDollars = 3980;
  productModel.image = "assets/imgPromotion/Nike/Nike2.png";

  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();

  //4
  productModel.storename = "Store Name";
  productModel.productName = "Converse";
  productModel.noOfRating = "จากปกติ 2990";
  productModel.priceInDollars = 1790;
  productModel.image = "assets/imgPromotion/Converse/Converse1.png";

  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();

  return trendingProducts;
}

List<ProductModel> getProducts() {
  List<ProductModel> products = new List();
  ProductModel productModel = new ProductModel();

  //1
  productModel.productName = "Converse Chuck72";
  productModel.noOfRating = "ราคาปกติ 2800";
  productModel.imgUrl = "assets/imgPromotion/Converse/Converse2.png";
  productModel.priceInDollars = 1800;

  products.add(productModel);
  productModel = new ProductModel();

  //1
  productModel.productName = "Converse Chuck taylor";
  productModel.noOfRating = "ราคาปกติ 7400";
  productModel.imgUrl = "assets/imgPromotion/Converse/Converse3.png";
  productModel.priceInDollars = 5890;

  products.add(productModel);
  productModel = new ProductModel();

  //1
  productModel.productName = "Puma Roma Basic";
  productModel.noOfRating = "ราคาปกติ 4900";
  productModel.imgUrl = "assets/imgPromotion/Puma/Puma1.png";
  productModel.priceInDollars = 3190;

  products.add(productModel);
  productModel = new ProductModel();

  //1
  productModel.productName = "Converse AlloverHI";
  productModel.noOfRating = "ราคาปกติ 3200";
  productModel.imgUrl = "assets/imgPromotion/Converse/Converse4.png";
  productModel.priceInDollars = 2590;

  products.add(productModel);
  productModel = new ProductModel();

  //1
  productModel.productName = "Puma.ST.20 Metal";
  productModel.noOfRating = "ราคาปกติ 2900";
  productModel.imgUrl = "assets/imgPromotion/Puma/Puma3.png";
  productModel.priceInDollars = 1990;

  products.add(productModel);
  productModel = new ProductModel();

  //1
  productModel.productName = "Vans Oldskool2.1";
  productModel.noOfRating = "ราคาปกติ 1990";
  productModel.imgUrl = "assets/imgPromotion/Vans/Vans2.png";
  productModel.priceInDollars = 990;

  products.add(productModel);
  productModel = new ProductModel();

  return products;
}

List<CategorieModel> getCategories() {
  List<CategorieModel> categories = new List();
  CategorieModel categorieModel = new CategorieModel();

  //1
  categorieModel.categorieName = "           Nike";
  categorieModel.color1 = "0xff8EA2FF";
  categorieModel.color2 = "0xff557AC7";
  categorieModel.imgAssetPath = "assets/imgPromotion/Nike/Nike1.png";

  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //2
  categorieModel.categorieName = "           Vans";
  categorieModel.color1 = "0xff50F9B4";
  categorieModel.color2 = "0xff38CAE9";
  categorieModel.imgAssetPath = "assets/imgPromotion/Vans/Vans4.png";

  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //3
  categorieModel.categorieName = "        Convers";
  categorieModel.color1 = "0xffFFB397";
  categorieModel.color2 = "0xffF46AA0";
  categorieModel.imgAssetPath = "assets/imgPromotion/Converse/Converse3.png";

  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //4
  categorieModel.categorieName = "           Puma";
  categorieModel.color1 = "0xff8EA2FF";
  categorieModel.color2 = "0xff557AC7";
  categorieModel.imgAssetPath = "assets/imgPromotion/Puma/Puma2.png";

  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //5
  categorieModel.categorieName = "          Adidas";
  categorieModel.color1 = "0xff8EA2FF";
  categorieModel.color2 = "0xff557AC7";
  categorieModel.imgAssetPath = "assets/imgPromotion/Adidas/adidas3.png";
  categorieModel.imgAssetPath = "assets/imgPromotion/Adidas/adidas3.png";

  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  return categories;
}
