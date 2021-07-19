class Product {
  final int productid;
  final String name;
  final String desc;
  final String content;
  final int cateogryid;
  final String image;
  final String urlvideo;

  Product(this.productid, this.name, this.desc, this.content, this.cateogryid, this.image, this.urlvideo);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['productid'],
      json['name'],
      json['desc'],
      json['content'],
      json['categoryid'],
      json['image'],
      json['urlvideo'],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json['productid'],
        json['name'],
        json['desc'],
        json['content'],
        json['categoryid'],
        json['image'],
        json['urlvideo']
    );
  }
}