// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductResponseModel> productResponseModelFromJson(String str) => List<ProductResponseModel>.from(json.decode(str).map((x) => ProductResponseModel.fromJson(x)));

String productResponseModelToJson(List<ProductResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponseModel {
  int id;
  String brand;
  String name;
  String price;
  dynamic priceSign;
  dynamic currency;
  String imageLink;
  String productLink;
  String websiteLink;
  String description;
  double rating;
  String category;
  String productType;
  List<dynamic> tagList;
  String createdAt;
  String updatedAt;
  String productApiUrl;
  String apiFeaturedImage;
  List<ProductColor> productColors;

  ProductResponseModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.priceSign,
    required this.currency,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    required this.rating,
    required this.category,
    required this.productType,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
    required this.productColors,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
    id: json["id"],
    brand: json["brand"],
    name: json["name"],
    price: json["price"],
    priceSign: json["price_sign"],
    currency: json["currency"],
    imageLink: json["image_link"],
    productLink: json["product_link"],
    websiteLink: json["website_link"],
    description: json["description"],
    rating: json["rating"] == null ? 0 : json["rating"]?.toDouble(),
    category: json["category"] == null ? "no data" : json["category"],
    productType: json["product_type"],
    tagList: List<dynamic>.from(json["tag_list"].map((x) => x)),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    productApiUrl: json["product_api_url"],
    apiFeaturedImage: json["api_featured_image"],
    productColors: List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "name": name,
    "price": price,
    "price_sign": priceSign,
    "currency": currency,
    "image_link": imageLink,
    "product_link": productLink,
    "website_link": websiteLink,
    "description": description,
    "rating": rating,
    "category": category,
    "product_type": productType,
    "tag_list": List<dynamic>.from(tagList.map((x) => x)),
    "created_at": createdAt,
    "updated_at": updatedAt,
    "product_api_url": productApiUrl,
    "api_featured_image": apiFeaturedImage,
    "product_colors": List<dynamic>.from(productColors.map((x) => x.toJson())),
  };
}

class ProductColor {
  String hexValue;
  String colourName;

  ProductColor({
    required this.hexValue,
    required this.colourName,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
    hexValue: json["hex_value"],
    colourName: json["colour_name"] == null ? "no data" : json["colour_name"],
  );

  Map<String, dynamic> toJson() => {
    "hex_value": hexValue,
    "colour_name": colourName,
  };
}
