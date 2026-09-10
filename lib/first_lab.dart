void main() {
  // Create two Lists of mobile-development topics
  List<String> coreTopics = ['Flutter', 'Dart', 'Widgets'];
  List<String> advancedTopics = ['State Management', 'API Integration', 'Firebase'];

  // Combine them using the spread operator
  List<String> allTopics = [...coreTopics, ...advancedTopics];
  print('Combined topics: $allTopics');

  // Create an optional nullable List and use ...?
  List<String>? optionalTopics;
  List<String> displayTopics = [
    ...coreTopics,
    ...?optionalTopics,
    'UI Design',
  ];
  print('Display topics: $displayTopics');

  // Use collection-if to add an admin menu item conditionally
  bool isAdmin = true;
  List<String> menuItems = [
    'Home',
    'Profile',
    if (isAdmin) 'Admin Dashboard',
    'Settings',
  ];
  print('Menu items: $menuItems');

  // Use collection-for to generate formatted labels
  List<String> labels = [
    for (String topic in allTopics) 'Topic: $topic',
  ];
  print('Labels: $labels');

  // Explanation for Flutter children lists
  print('''
  These collection features are very useful in Flutter when building widget children lists:
  - spread operator (...) merges multiple lists into one list of children
  - ...? handles nullable lists safely when a list may be null
  - collection-if conditionally adds widgets such as menu items or actions
  - collection-for dynamically creates widgets from a list of data
  Example: children: [...items, if (isAdmin) const AdminButton(), for (var item in data) Text(item)]
  ''');
}
