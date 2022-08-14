import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  final col = Column(
    children: <Widget>[
      Text('No transactions added yet...'),
      SizedBox(
        height: 20,
      ),
      Container(
        height: 200,
        child: Image.asset(
          'assets/images/waiting.png',
          fit: BoxFit.cover,
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? col
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
            // children: transactions.map((t) {}).toList(),
          );
  }
}
