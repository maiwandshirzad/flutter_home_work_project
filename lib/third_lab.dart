void main() {
  // Create a List of five course names
  List<String> courses = ['Math', 'Physics', 'Chemistry', 'Biology', 'English'];

  // Print the first and last items
  print('First course: ${courses.first}');
  print('Last course: ${courses.last}');

  // Add a new course
  courses.add('Flutter');
  print('After adding a course: $courses');

  // Remove one course
  courses.remove('Biology');
  print('After removing a course: $courses');

  // Check whether 'Flutter' exists
  bool hasFlutter = courses.contains('Flutter');
  print('Does the list contain Flutter? $hasFlutter');

  // Iterate through the List with for-in
  print('Courses using for-in loop:');
  for (String course in courses) {
    print(course);
  }

  // Create a List of marks and calculate the average
  List<int> marks = [80, 90, 85, 95, 70];
  int total = 0;

  for (int mark in marks) {
    total += mark;
  }

  double average = total / marks.length;
  print('Marks: $marks');
  print('Average mark: $average');
}
