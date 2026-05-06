
class ProductModel{
  String id; 
  String title;
  double price;
  double discount;
  // String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    // required this.image,
  });

  double getdiscountAmount() {
    return price * discount / 100;
  }

  double getfinalPrice() {
    return price - getdiscountAmount();
  }
}
