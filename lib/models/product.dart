import 'package:elancer_second_proj/models/pivot.dart';
import 'package:elancer_second_proj/models/slider.dart';
import 'package:elancer_second_proj/models/sub_categories.dart';

class Product {
 late int id;
 late String nameEn;
 late String nameAr;
 late String infoEn;
 late String infoAr;
 late num price;
 late int quantity;
 late int overalRate;
 late int subCategoryId;
 late int productRate;
 late num? offerPrice;
 late bool isFavorite;
 late String imageUrl;
 late Pivot pivot;
 late List<SliderImage> images;
 late SubCategories subCategory;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    if (json['pivot'] != null) pivot = Pivot.fromJson(json['pivot']);
    if (json['images'] != null) {
      images = <SliderImage>[];
      json['images'].forEach((v) {
        images.add( SliderImage.fromJson(v));
      });
    }
  }
}