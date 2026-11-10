// Pure Dart CLI covering Labs 1 through 6 and Mini Project
void main() {
  print('================ DART ADVANCED FEATURES LABS ================');

  // Lab 1: Spread & Null-Aware Spread & Collection-if/for
  print('\n--- Lab 1: Spread & Collection Operators ---');
  final coreTopics = ['Dart', 'Flutter'];
  List<String>? optionalTopics = ['Firebase', 'REST API'];
  bool isAdmin = true;

  final allTopics = [
    ...coreTopics,
    ...?optionalTopics,
    if (isAdmin) 'Admin Panel Config',
  ];
  print('Combined Topics: $allTopics');

  final formattedLabels = [for (final t in allTopics) 'Module: $t'];
  print('Formatted Labels: $formattedLabels');

  // Lab 2: Maps and Map -> Object Named Constructor
  print('\n--- Lab 2: Map & Deserialization ---');
  Map<String, dynamic> studentMap = {
    'name': 'Ahmad',
    'id': 101,
    'semester': 7,
    'department': 'Software Engineering',
    'address': {'city': 'Kabul', 'country': 'Afghanistan'}
  };
  print('Student from Map: ${studentMap['name']} (${studentMap['department']})');

  final studentObj = Student.fromMap(studentMap);
  print('Deserialized Student Object: ${studentObj.name}, Sem: ${studentObj.semester}');

  // Lab 3: First-Class Functions & Arrow Syntax
  print('\n--- Lab 3: Functions as Objects ---');
  int add(int a, int b) => a + b;
  int multiply(int a, int b) => a * b;

  int calculate(int x, int y, int Function(int, int) op) => op(x, y);

  print('Higher order calculate (add): ${calculate(5, 4, add)}');
  print('Higher order calculate (multiply): ${calculate(5, 4, multiply)}');

  final nums = [1, 2, 3, 4, 5];
  final squares = nums.map((n) => n * n).toList();
  print('Mapped squares: $squares');

  // Lab 4: Named Parameters & Named Constructors
  print('\n--- Lab 4: Parameters & Constructors ---');
  final regularProduct = Product(id: 1, name: 'Flutter Book', price: 29.99);
  final freeProduct = Product.free(id: 2, name: 'Open Source Cheatsheet');
  print(regularProduct);
  print(freeProduct);

  // Lab 5: Private Members & Mixins
  print('\n--- Lab 5: Private Members & Mixins ---');
  final account = BankAccount(accountHolder: 'Ali');
  account.deposit(500.0);
  print('Account holder: ${account.accountHolder}, Balance: ${account.balance}');

  // Lab 6: Cascade Operator
  print('\n--- Lab 6: Cascade Operator (..) ---');
  final profile = ConfigurableProfile()
    ..name = 'Sara'
    ..department = 'Software Engineering'
    ..semester = 8
    ..logStatus();
}

mixin Logger {
  void log(String message) => print('[LOG] $message');
}

class BankAccount with Logger {
  final String accountHolder;
  double _balance = 0.0; // Private to this library

  BankAccount({required this.accountHolder});

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      log('Deposited \$$amount to $accountHolder. New balance: \$$_balance');
    }
  }
}

class Student {
  final String name;
  final int semester;

  Student({required this.name, required this.semester});

  Student.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? '',
        semester = map['semester'] ?? 1;
}

class Product {
  final int id;
  final String name;
  final double price;
  final bool isDigital;

  const Product({
    required this.id,
    required this.name,
    this.price = 0.0,
    this.isDigital = true,
  });

  const Product.free({
    required this.id,
    required this.name,
  })  : price = 0.0,
        isDigital = true;

  @override
  String toString() => 'Product(id: $id, name: "$name", price: \$$price, digital: $isDigital)';
}

class ConfigurableProfile with Logger {
  String name = '';
  String department = '';
  int semester = 1;

  void logStatus() {
    log('Profile Configured: $name ($department, Semester $semester)');
  }
}
