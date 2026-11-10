// Pure Dart CLI execution for Labs 1, 2, 3, 4, and Mini-Project
void main() {
  print('================ DART LANGUAGE LABS ================');

  // Lab 1: Variables, Types & Inference
  print('\n--- Lab 1: Dart Basics ---');
  String studentName = 'Ahmad';
  int age = 22;
  int semester = 7;
  double score = 88.5;
  bool active = true;
  var inferredUni = 'Kabul University'; // Inferred as String
  var inferredCredits = 18; // Inferred as int

  print('Student: $studentName, Age: $age, Semester: $semester, GPA/Score: $score, Active: $active');
  print('Inferred Uni: $inferredUni (${inferredUni.runtimeType}), Credits: $inferredCredits (${inferredCredits.runtimeType})');
  print('Arithmetic Ops: 10 + 3 = ${10 + 3}, 10 / 3 = ${10 / 3}, 10 ~/ 3 = ${10 ~/ 3}, 10 % 3 = ${10 % 3}');

  // Lab 2: Conditions and Loops
  print('\n--- Lab 2: Conditions & Loops ---');
  String letterGrade(double s) {
    if (s >= 90) return 'A';
    if (s >= 80) return 'B';
    if (s >= 70) return 'C';
    if (s >= 60) return 'D';
    return 'F';
  }
  print('Score $score gives grade: ${letterGrade(score)}');
  print('Status: ${score >= 60 ? "Pass" : "Fail"}');

  List<int> evens = [];
  for (int i = 1; i <= 20; i++) {
    if (i % 2 == 0) evens.add(i);
  }
  print('Even numbers 1-20: $evens');

  // Lab 3: Lists
  print('\n--- Lab 3: Lists ---');
  List<String> courses = ['Flutter', 'Database', 'Networking', 'Algorithms', 'Security'];
  print('First course: ${courses.first}, Last course: ${courses.last}');
  courses.add('AI');
  courses.remove('Networking');
  print('Contains Flutter? ${courses.contains('Flutter')}');
  print('Updated course list: $courses');

  List<double> marks = [85.0, 92.5, 78.0, 90.0];
  double total = 0;
  for (final m in marks) {
    total += m;
  }
  print('Average marks: ${total / marks.length}');

  // Lab 4: Classes & Constructors
  print('\n--- Lab 4: Classes and Objects ---');
  List<Student> students = [
    Student('Ahmad', 'Software Engineering', 7, [88, 92, 79]),
    Student('Fatima', 'Computer Science', 6, [95, 90, 94]),
    Student('Omid', 'Information Systems', 7, [68, 74, 70]),
  ];

  for (final s in students) {
    s.displayInfo();
  }
}

class Student {
  final String name;
  final String department;
  final int semester;
  final List<double> marks;

  Student(this.name, this.department, this.semester, this.marks);

  double get average => marks.isEmpty ? 0 : marks.reduce((a, b) => a + b) / marks.length;
  bool get isPassed => average >= 60;

  void displayInfo() {
    print('$name | $department | Semester $semester | Avg: ${average.toStringAsFixed(1)} | ${isPassed ? "Pass" : "Fail"}');
  }
}
