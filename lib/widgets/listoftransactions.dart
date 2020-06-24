import './transactionItems.dart';
import 'package:flutter/material.dart';

import '../modals/transaction.dart';

class ListOfTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTrans;

  const ListOfTransactions(this.transactions, this._deleteTrans);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder :(ctx, constrains){
      return transactions.length == 0
          ? LayoutBuilder(builder: (ctx, constrains){
            return Column(
                children: <Widget>[
                Container(
                  height: constrains.maxHeight *0.15,
                  child: Text(
                    "NO TRANSACTION",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: constrains.maxHeight * 0.05,
                ),
                Container(
                  height: constrains.maxHeight * 0.8,
                  child: Image.asset(
                    "assets/images/NoTransaction.png",
                    fit: BoxFit.cover,
                  ),
                )
               ],
            );
          })
          :
      ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionItem(transactions[index],_deleteTrans);
        },
        itemCount: transactions.length,
      );
    });
  }
}
