class Category {
 late int id;
 late String nameEn;
 late String nameAr;
 late String image;
 late int productsCount;
 late int subCategoriesCount=0;
 late String imageUrl;

 Category.fromJson(Map<String, dynamic> json) {
   id = json['id'];
   nameEn = json['name_en'];
   nameAr = json['name_ar'];
   image = json['image'];
   productsCount = json['products_count']??0;
   subCategoriesCount = json['sub_categories_count']??0;
   imageUrl = json['image_url'];
 }


}