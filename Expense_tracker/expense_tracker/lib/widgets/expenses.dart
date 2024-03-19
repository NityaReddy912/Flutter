//9
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  //4
  // dummy data
  final List<Expense> _registerdExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 1234.45,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 300,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  //16.1
  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpenses.add(expense);
    });
  }

  //17.1
  void _removeExpense(Expense expense) {
    // 18.2
    final expenseIndex = _registerdExpenses.indexOf(expense);
    //17
    setState(() {
      _registerdExpenses.remove(expense);
    });

    // 18.1
    // Clear any previous snackbar messages on the screen.
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Epense deleted!'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              _insertExpense(expenseIndex, expense);
            }),
      ),
    );
  }

  //18
  void _insertExpense(index, Expense expense) {
    setState(() {
      _registerdExpenses.insert(index, expense);
    });
  }

  //10
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // Make it as a fullscreen modal
      isScrollControlled: true,
      context: context,
      // builder: (ctx) => const Text('Modal Bottom Sheet!'));

      // //11
      // builder: (ctx) => const NewExpense(),

      //16.2
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //19
    Widget mainContent = const Center(
      child: Text(
        'No expenses found. Start adding some!',
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );

    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerdExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ExpenseTracker'),
          actions: [
            IconButton(
              // onPressed: (){},
              //10
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        // body: const Column(
        //   children: [
        //     Text('The Chart!'),
        //     Text('Expense List...'),
        //   ],
        // ));
        //5
        body: Column(
          children: [
            Chart(expenses: _registerdExpenses),
            // Text('Expense List...'),
            Expanded(
              // child: ExpensesList(expenses: _registerdExpenses),
              // //17.2
              //  child: ExpensesList(
              //   expenses: _registerdExpenses,
              //   onRemoveExpense: _removeExpense,),
              //19
              child: mainContent,
            ),
          ],
        ));
  }
}

// import 'package:expense_tracker_app/models/expense.dart';
// import 'package:expense_tracker_app/widgets/expenses_list.dart';
// import 'package:flutter/material.dart';

// class Expenses extends StatefulWidget {
//   const Expenses({super.key});

//   @override
//   State<Expenses> createState() => _ExpensesState();
// }

// class _ExpensesState extends State<Expenses> {
//   //4
//   // dummy data
//   final List<Expense> _registerdExpenses = [
//     Expense(
//         title: 'Flutter Course',
//         amount: 1234.45,
//         date: DateTime.now(),
//         category: Category.work),
//     Expense(
//         title: 'Movie',
//         amount: 300,
//         date: DateTime.now(),
//         category: Category.leisure),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter ExpenseTracker'),
//         ),
//         // body: const Column(
//         //   children: [
//         //     Text('The Chart!'),
//         //     Text('Expense List...'),
//         //   ],
//         // ));
//         //5
//         body: Column(
//           children: [
//             const Text('The Chart!'),
//             // Text('Expense List...'),
//             Expanded(
//               child: ExpensesList(expenses: _registerdExpenses),
//               ),
//           ],
//         ));
//   }
// }
