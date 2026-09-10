mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

class BankAccount with Logger {
  double _balance;

  BankAccount(this._balance);

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      print('Invalid deposit amount.');
      return;
    }

    _balance += amount;
    log('Deposited $amount. New balance: $_balance');
  }
}

void main() {
  BankAccount account = BankAccount(1000.0);
  print('Initial balance: ${account.balance}');

  account.deposit(250.0);
  account.deposit(-50.0);

  print('Final balance: ${account.balance}');
}
