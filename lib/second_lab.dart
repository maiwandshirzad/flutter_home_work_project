class StudentMapModel {
  final String name;
  final String id;
  final int semester;
  final String department;
  final Map<String, dynamic> address;

  StudentMapModel({
    required this.name,
    required this.id,
    required this.semester,
    required this.department,
    required this.address,
  });

  factory StudentMapModel.fromMap(Map<String, dynamic> data) {
    return StudentMapModel(
      name: data['name'],
      id: data['id'],
      semester: data['semester'],
      department: data['department'],
      address: Map<String, dynamic>.from(data['address'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'StudentMapModel(name: $name, id: $id, semester: $semester, department: $department, address: $address)';
  }
}

void main() {
  Map<String, dynamic> student = {
    'name': 'Ali',
    'id': 'CS-101',
    'semester': 5,
    'department': 'Computer Science',
  };

  print('Initial student map: $student');

  // Read and update values
  print('Name: ${student['name']}');
  student['semester'] = 6;
  print('Updated student map: $student');

  // Add a new key
  student['cgpa'] = 3.8;
  print('After add: $student');

  // Remove a key
  student.remove('department');
  print('After remove: $student');

  // Iterate over entries
  print('Entries:');
  for (var entry in student.entries) {
    print('${entry.key}: ${entry.value}');
  }

  // Create a nested address Map
  Map<String, dynamic> address = {
    'city': 'Lahore',
    'street': 'Main Road',
    'zipCode': '54000',
  };

  student['address'] = address;
  print('Student with address: $student');

  // Convert the Map into a Student object using a named constructor
  StudentMapModel studentObject = StudentMapModel.fromMap(student);
  print('Student object: $studentObject');
}
