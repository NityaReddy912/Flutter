//12

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  // const NewExpense({super.key});

  //16.2

  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
  }

class _NewExpenseState extends State<NewExpense> {
  //12

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  //14

  DateTime? _selectedDate;

  //15

  Category _selectedCategory = Category.leisure;

// Explicitly free the controller this is required for TextEditingController

  @override
  void dispose() {
    //12.2

    _titleController.dispose();

    _amountController.dispose();

    super.dispose();
  }

  // //14.2

  // // Just to show datepicker

  // void _presentDatePicker(){

  //     final now = DateTime.now();

  //     final firstDate = DateTime(now.year - 1,now.month,now.day);

  //     showDatePicker(

  //       context: context,

  //       initialDate: now,

  //       firstDate: firstDate,

  //       lastDate: now,

  //     );

  // }

  //14.2

  // Get the datae from show datepicker

  void _presentDatePicker() async {
    final now = DateTime.now();

    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    debugPrint(pickedDate.toString());

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  //16

  void _submitExpenseData() {
    // validation

    final enteredAmount = double.tryParse(_amountController.text);

    // tryParse('hello') - null, tryParse('1.23') - 1.23

    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input!'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }

    // Once everything is validated then call onAddExpense to add the expense

    // in expenses list

    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount!,
        date: _selectedDate!,
        category: _selectedCategory));

    // After adding new expenses overlay should be closed

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // 24.3 for screen overlays

    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    //24.4

    return LayoutBuilder(builder: (ctx, constraints) {
      //24.4

      final width = constraints.maxWidth;

      //24.3

      return SizedBox(
        height: double.infinity,

        //24.3

        child: SingleChildScrollView(
          child: Padding(
            // padding: const EdgeInsets.all(16.0),

            //24.3

            // padding: EdgeInsets.fromLTRB(16,48,16, keyboardSpace + 16),

            // 24.4

            // for useSafeArea

            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),

            child: Column(
              children: [
                //24.4

                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                    ],
                  )
                else

                  //12.1

                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),

                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? 'No date selected'
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(
                                Icons.calendar_month,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      //12.1

                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Amount'),
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 16,
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //14.1

                            Text(
                              _selectedDate == null
                                  ? 'No date selected!'
                                  : formatter.format(_selectedDate!),
                            ),

                            IconButton(
                              // onPressed: (){},

                              //14.2

                              onPressed: _presentDatePicker,

                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                const SizedBox(height: 16),

                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _submitExpenseData,
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      //15

                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),

                      const Spacer(),

                      TextButton(
                        onPressed: () {
                          //13 Manually Closing the modal

                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),

                      ElevatedButton(
                        // onPressed: () {

                        //   debugPrint(_titleController.text);

                        //   debugPrint(_amountController.text);

                        // },

                        //16

                        onPressed: _submitExpenseData,

                        child: const Text('Save Expense'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
