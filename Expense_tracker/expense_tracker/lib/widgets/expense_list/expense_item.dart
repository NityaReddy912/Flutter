import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

//7
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text(expense.title,
              style: const TextStyle(color: Colors.black, fontSize: 20)),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text('Rs ${expense.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  // const Icon(Icons.alarm),
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  //Text(expense.date.toString()),
                  //8
                  Text(expense.formattedDate),
                ],
              )
            ],
          )
              ],
            ),
        ));
  }
}
