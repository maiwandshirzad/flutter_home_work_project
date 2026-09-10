void normalFunction() {
  print('This is a normal function.');
}

void arrowFunction() => print('This is a fat-arrow function.');

String greet(String name) => 'Hello, $name!';

void runWithFunction(String message, void Function() action) {
  print(message);
  action();
}

void main() {
  // Create normal and fat-arrow functions
  normalFunction();
  arrowFunction();

  // Assign a function to a variable
  var sayHi = greet;
  print(sayHi('Sara'));

  // Pass a function to another function
  runWithFunction('Running callback...', () {
    print('Callback executed.');
  });

  // Use an anonymous function
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> doubled = numbers.map((n) => n * 2).toList();
  print('Original: $numbers');
  print('Doubled: $doubled');

  // Create a Flutter button callback using both a named and anonymous function
  void namedButtonCallback() {
    print('Named callback triggered');
  }

  void Function() anonymousButtonCallback = () {
    print('Anonymous callback triggered');
  };

  namedButtonCallback();
  anonymousButtonCallback();
}
