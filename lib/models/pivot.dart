class Pivot {
 late int userId;
 late int productId;


  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
  }

}