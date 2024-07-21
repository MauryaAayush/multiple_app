class ProductModel {
  List<Product>? product;
  int? total, skip, limit;

  ProductModel({this.limit, this.skip, this.total, this.product});

  factory ProductModel.fromJson(Map json) {
    return ProductModel(
        limit: json['limit'],
        product:
            json['products'].map<Product>((e) => Product.fromJson(e)).toList(),
        skip: json['skip'],
        total: json['total']);
  }
}

class Product {
  int? id, stock, minimumOrderQuantity;
  String? title,
      description,
      category,
      brand,
      warrantyInformation,
      shippingInformation,
      availabilityStatus;
  String? returnPolicy, thumbnail;

  List? images;
  List<Reviews?> reviews;

  Product(
      {this.id,
      this.stock,
      this.minimumOrderQuantity,
      this.title,
      this.description,
      this.category,
      this.brand,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.returnPolicy,
      this.thumbnail,
      this.images,
      required this.reviews});

  factory Product.fromJson(Map json) {
    return Product(
      title: json['title'],
      description: json['description'],
      id: json['id'],
      category: json['category'],
      availabilityStatus: json['availabilityStatus'],
      brand: json['brand'] ?? "No Brands",
      images: json['images'],
      // .map ((e)=> Product.fromJson(e)).toList(),
      minimumOrderQuantity: json['minimumOrderQuantity'],
      returnPolicy: json['returnPolicy'],
      reviews:
          json['reviews'].map<Reviews>((e) => Reviews.fromJson(e)).toList(),
      shippingInformation: json['shippingInformation'],
      stock: json['stock'],
      thumbnail: json['thumbnail'],
      warrantyInformation: json['warrantyInformation'],

      // json['products'].map<Product>((e) => Product.fromJson(e)).toList(),
    );
  }
}

class Reviews {
  int? rating;
  String? comments, date, reviewerName, reviewerEmail;

  Reviews(
      {this.rating,
      this.comments,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  factory Reviews.fromJson(Map json) {
    return Reviews(
        comments: json['comment'] ?? "No comments",
        date: json['date'] ?? "No Dates",
        rating: json['rating'] ?? "No Rating",
        reviewerEmail: json['reviewerEmail'] ?? "No Email",
        reviewerName: json['reviewerName'] ?? "No Name");
  }
}
