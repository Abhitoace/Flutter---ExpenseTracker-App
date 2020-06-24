import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modals/transaction.dart';

class TransactionItem extends StatelessWidget{

  final Transaction _itemTransactions;
  final Function _deleteItemTrans;

  TransactionItem(this._itemTransactions, this._deleteItemTrans);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 7, horizontal: 4),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            radius: 35,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "${_itemTransactions.amount}",
                ),
              ),
            ),
          ),
          title: Text(
            "${_itemTransactions.title}",
          ),
          subtitle: Text("${DateFormat.yMMMd().format(_itemTransactions.date)}"),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: ()=>_deleteItemTrans(_itemTransactions.id),
          ),
        ),
      ),
    );;
  }

}