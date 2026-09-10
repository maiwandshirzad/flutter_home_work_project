import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Type inference examples:
    // final studentName = 'Alice';  => inferred as String
    // final age = 20;               => inferred as int
    // final semester = 5;           => inferred as int
    // final gpa = 3.85;             => inferred as double
    // final isActive = true;        => inferred as bool
    final studentName = 'Alice';
    final age = 20;
    final semester = 5;
    final gpa = 3.85;
    final isActive = true;

    final nextSemester = semester + 1;
    final totalMarks = age * 10;
    final projectedGpa = gpa + 0.15;
    final averageGpa = gpa / 2;

    final isAdult = age >= 18;
    final isPassing = gpa >= 2.0;
    final isEligible = isAdult && isPassing && isActive;
    final isNotActive = !isActive;

    print('Student name: $studentName');
    print('Age: $age');
    print('Semester: $semester');
    print('GPA: $gpa');
    print('Active Status: $isActive');
    print('Arithmetic results:');
    print('Next semester = $nextSemester');
    print('Total Marks = $totalMarks');
    print('Projected GPA = $projectedGpa');
    print('Average GPA = $averageGpa');
    print('Comparison and logical results:');
    print('isAdult: $isAdult');
    print('isPassing: $isPassing');
    print('isEligible: $isEligible');
    print('isNotActive: $isNotActive');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $studentName'),
            Text('Age: $age'),
            Text('Semester: $semester'),
            Text('GPA: $gpa'),
            Text('Active: $isActive'),
          ],
        ),
      ),
    );
  }
}
