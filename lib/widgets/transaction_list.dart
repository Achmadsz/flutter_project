import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  //cara menampilkan image di file local
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          // Listview. bulder diload lebih ringang dari list view lainnya
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  //ListTitle widget membuat pemformatan card lebih mudah
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}