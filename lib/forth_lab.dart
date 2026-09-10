class Student {
  String name;
  String department;
  int semester;

  Student(this.name, this.department, this.semester);

  void displayInfo() {
    print('Name: $name');
    print('Department: $department');
    print('Semester: $semester');
    print('------------------------');
  }
}

void main() {
  Student student1 = Student('Ali', 'Computer Science', 5);
  Student student2 = Student('Sara', 'Software Engineering', 4);
  Student student3 = Student('Hassan', 'Information Technology', 6);

  List<Student> students = [student1, student2, student3];

  for (Student student in students) {
    student.displayInfo();
  }
}
