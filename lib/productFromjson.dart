import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.images,
    this.imagesProduct,
    this.name,
    this.information,
    this.price,
  });

  int id;
  String images;
  String imagesProduct;
  String name;
  String information;
  String price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["ID"] == null ? null : json["ID"],
        images: json["Images"] == null ? null : json["Images"],
        imagesProduct:
            json["ImagesProduct"] == null ? null : json["ImagesProduct"],
        name: json["Name"] == null ? null : json["Name"],
        information: json["information"] == null ? null : json["information"],
        price: json["Price"] == null ? null : json["Price"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "Images": images == null ? null : images,
        "ImagesProduct": imagesProduct == null ? null : imagesProduct,
        "Name": name == null ? null : name,
        "information": information == null ? null : information,
        "Price": price == null ? null : price,
      };
}
