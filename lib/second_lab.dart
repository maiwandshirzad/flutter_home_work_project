void main() {
  // Read or define a numeric mark
  int mark = 87;

  // Use conditions to determine Pass/Fail and letter grade
  String result = mark >= 50 ? 'Pass' : 'Fail';
  String letterGrade;

  if (mark >= 90) {
    letterGrade = 'A';
  } else if (mark >= 80) {
    letterGrade = 'B';
  } else if (mark >= 70) {
    letterGrade = 'C';
  } else if (mark >= 60) {
    letterGrade = 'D';
  } else {
    letterGrade = 'F';
  }

  print('Mark: $mark');
  print('Result: $result');
  print('Letter Grade: $letterGrade');

  // Print numbers 1–20 using a for loop
  print('\nNumbers 1 to 20:');
  for (int i = 1; i <= 20; i++) {
    print(i);
  }

  // Print only even numbers
  print('\nEven numbers from 1 to 20:');
  for (int i = 1; i <= 20; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }

  // Repeat one task with a while loop
  print('\nEven numbers using while loop:');
  int j = 1;
  while (j <= 20) {
    if (j % 2 == 0) {
      print(j);
    }
    j++;
  }

  // Use a ternary expression for a simple status
  String status = mark >= 50 ? 'Eligible' : 'Not Eligible';
  print('\nStatus: $status');
}
