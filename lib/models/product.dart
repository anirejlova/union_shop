enum ClothingSize { small, medium, large }

enum ProductType {
  hoodie,
  tshirt,
  notebook,
  stuff,
}

class Product {
  final ProductType type;
  final ClothingSize? size;

  Product({
    required this.type,
    this.size,
  });

  String get name {
    switch (type) {
      case ProductType.hoodie:
        return 'Union Hoodie';
      case ProductType.tshirt:
        return 'Union T-Shirt';
      case ProductType.notebook:
        return 'Union Notebook';
      case ProductType.stuff:
        return 'Union Stuff';
    }
  }

  String get image {
    String typeString = type.name;
    return 'assets/images/$typeString.png';
  }
}
