class ProductModel {
  List<Product>? products;
  int? total, skip, limit;

  ProductModel({this.limit, this.skip, this.total, this.products});

  factory ProductModel.fromJson(Map json) {
    return ProductModel(
      limit: json['limit'],
      products: (json['products'] as List)
          .map<Product>((e) => Product.fromJson(e))
          .toList(),
      skip: json['skip'],
      total: json['total'],
    );
  }
}

class Product {
  int? id;
  String? title, brand, thumbnail;
  double? price;
  double? rating;

  Product({this.id, this.title, this.brand, this.thumbnail, this.price, this.rating});

  factory Product.fromJson(Map json) {
    return Product(
      id: json['id'],
      title: json['title'],
      brand: json['brand'] ?? "No Brand",
      thumbnail: json['thumbnail'],
      price: json['price'],
      rating: json['rating'],
    );
  }
}
