class Product {
  final String name;
  final double price;
  final String category;
  final bool inStock;

  const Product({
    required this.name,
    required this.price,
    this.category = 'General',
    this.inStock = true,
  });

  Product.freeProduct()
      : name = 'Free Sample',
        price = 0.0,
        category = 'Promo',
        inStock = true;

  @override
  String toString() {
    return 'Product(name: $name, price: $price, category: $category, inStock: $inStock)';
  }
}

void main() {
  Product p1 = Product(
    name: 'Laptop',
    price: 899.99,
    category: 'Electronics',
    inStock: true,
  );

  Product p2 = Product(
    name: 'Notebook',
    price: 15.50,
  );

  Product freeProduct = Product.freeProduct();

  print('Product 1: $p1');
  print('Product 2: $p2');
  print('Free product: $freeProduct');
}
