import 'product.dart';

class PricingRepository {
  double calculatePrice({required int quantity, required double price}) {
    return quantity * price;
  }
}

class CartItem {
  final Product product;
  final double price;

  CartItem({required this.product, required this.price});
}

class Cart {
  final Map<CartItem, int> _items = {};

  // Returns a read-only copy of the items and their quantities
  Map<CartItem, int> get items => Map.unmodifiable(_items);

  void add(CartItem item, {int quantity = 1}) {
    if (_items.containsKey(item)) {
      _items[item] = _items[item]! + quantity;
    } else {
      _items[item] = quantity;
    }
  }

  void remove(CartItem item, {int quantity = 1}) {
    if (_items.containsKey(item)) {
      final currentQty = _items[item]!;
      if (currentQty > quantity) {
        _items[item] = currentQty - quantity;
      } else {
        _items.remove(item);
      }
    }
  }

  void clear() {
    _items.clear();
  }

  double get totalPrice {
    final pricingRepository = PricingRepository();
    double total = 0.0;

    for (CartItem item in _items.keys) {
      int quantity = _items[item]!;
      total += pricingRepository.calculatePrice(
        quantity: quantity,
        price: item.price,
      );
    }

    return total;
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;

  int get countOfItems {
    int total = 0;
    for (CartItem item in _items.keys) {
      total += _items[item]!;
    }
    return total;
  }

  int getQuantity(CartItem item) {
    if (_items.containsKey(item)) {
      return _items[item]!;
    }
    return 0;
  }
}
