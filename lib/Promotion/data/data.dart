import 'package:Shopper/Promotion/models/categorie_model.dart';
import 'package:Shopper/Promotion/models/product_model.dart';
import 'package:Shopper/Promotion/models/trending_productmodel.dart';

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
