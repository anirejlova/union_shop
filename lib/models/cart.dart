class PricingRepository {
  double calculatePrice({required int quantity, required double price}) {
    return quantity * price;
  }
}

