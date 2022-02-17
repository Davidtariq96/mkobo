///DEPENDENCY INJECTION
//By definition Dependency injection is an
// object-oriented technique that sends the dependencies of another object to an object. It helps to prevent tight coupling

///pseudo code for a BANK ACCOUNT
/*
1. Creating an abstract Super Account class
2. Creating child classes for current and savings account
3. A customer class and passing in the child classes as a property of the customer class by injecting it as a dependency
4. Anytime an instance class of Customer class is instantiated the property bank account can either be savings or current
*/
class Account {
  String firstName;
  String lastName;
  String accountBalance;
  Account(
      {required this.firstName,
      required this.lastName,
      required this.accountBalance});
}

class CurrentAccount extends Account {
  double interestRate;
  CurrentAccount(
      {required String firstName,
      required String lastName,
      required String accountBalance,
      required this.interestRate})
      : super(
            firstName: firstName,
            lastName: lastName,
            accountBalance: accountBalance);
}

class SavingsAccount extends Account {
  double interestRate;
  SavingsAccount(
      {required String firstName,
      required String lastName,
      required String accountBalance,
      required this.interestRate})
      : super(
            firstName: firstName,
            lastName: lastName,
            accountBalance: accountBalance);
}

///Injecting ACCOUNT CLASS AS A DEPENDENCY TO CUSTOMER CLASS
class Customer {
  Account bankAccounts;
  Customer({required this.bankAccounts});
}

Customer sam = Customer(
    bankAccounts: SavingsAccount(
        firstName: "same",
        lastName: "david",
        accountBalance: "2000",
        interestRate: 10.6));
Customer david = Customer(
    bankAccounts: CurrentAccount(
        firstName: "same",
        lastName: "david",
        accountBalance: "2000",
        interestRate: 4.6));
