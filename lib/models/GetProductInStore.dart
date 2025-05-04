class Getproductinstore{
  final int id;
  final String name;
  final String description;
  final int price;
  final int stock;
  final int brandId ;
  final String brandName;
  final int categoryyId;
  final String categoryName;
  final int storeId;
  final ImageModel imageUrl;
  
  Getproductinstore({
    required this.brandId,
    required this.brandName,
    required this.categoryName,
    required this.categoryyId,
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.storeId,
    required this.imageUrl,
    
  });
  factory Getproductinstore.fromJson(jsonData){
    return Getproductinstore(
      brandId: jsonData['brandId'],
     brandName:  jsonData['brandName'],
      categoryName:  jsonData['categoryName'], 
      categoryyId:  jsonData['categoryId'],
       description: jsonData['description'], 
       id: jsonData['id'], 
       name:  jsonData['name'],
        price:  jsonData['price'], 
        stock:  jsonData['stock'], 
        storeId:  jsonData['storeId'],
        imageUrl: ImageModel.fromJson(jsonData['imageUrl']),
        );
  }
}
class ImageModel{
  final String imageUrl;
  ImageModel({required this.imageUrl});
  factory ImageModel.fromJson(jsonData){
    return ImageModel(imageUrl: jsonData['imageUrl'],);
  }
}