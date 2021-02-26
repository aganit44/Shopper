
class Product {
  final String ID;
  final String Images;
  final String Name;
  final String Price;


  Product(ProductList,
      {this.ID,
        this.Images,
        this.Name,
        this.Price,
      });
}

class ProductList{
  final List<dynamic> product;

  ProductList({this.product});

}
