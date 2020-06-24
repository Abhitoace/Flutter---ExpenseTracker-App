import 'dart:io';

import 'package:flutter/material.dart';

import './widgets/listoftransactions.dart';
import './widgets/addTransaction.dart';
import './widgets/chart.dart';
import './modals/transaction.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Transaction> _trans = [];
  bool _showChart = false;

  void _addNewTransaction(String title, double amt, DateTime date ){
    Transaction tr = Transaction(
        title: title,
        amount: amt,
        date: date,
        id: DateTime.now().toString()
    );
    setState(() {
      _trans.add(tr);
    });
  }

  void _deleteTransaction(String txID){
    setState(() {
      _trans.removeWhere((element) => element.id == txID);
    });
  }

  List<Transaction> get _weekTrans{
    return _trans.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void modalSheetToAddTransaction(BuildContext context){
    showModalBottomSheet(context : context ,builder:(_){
      return AddTransaction(_addNewTransaction);
    });
  }



  @override
  Widget build(BuildContext context) {

    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar =  AppBar(
      title: Text("Expense Planner"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add,),
          onPressed: ()=>modalSheetToAddTransaction(context),
        ),
      ],
      backgroundColor: Colors.green,
    );

    final txWidget = Container(
      height: (MediaQuery.of(context).size.height-
          appBar.preferredSize.height-
          MediaQuery.of(context).padding.top) * 0.7,
      child: ListOfTransactions(_trans, _deleteTransaction),
    );

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                if(isLandscape) Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Show Chart", style: Theme.of(context).textTheme.bodyText1,),
                    Switch.adaptive(
                      value: _showChart,
                      onChanged: (val){
                        setState(() {
                          _showChart = val;
                        });
                      },),
                  ],
                ),
                if(!isLandscape)Container(
                  height: (MediaQuery.of(context).size.height-
                      appBar.preferredSize.height-
                      MediaQuery.of(context).padding.top) * 0.3,
                  child: Chart(_weekTrans),
                ),
                if(!isLandscape) txWidget,

                if(isLandscape) _showChart ? Container(
                    height: (MediaQuery.of(context).size.height-
                        appBar.preferredSize.height-
                        MediaQuery.of(context).padding.top) * 0.8,
                    child: Chart(_weekTrans),
                )
                    :
                    txWidget,
              ]
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Platform.isIOS ?
            null
            :
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            modalSheetToAddTransaction(context);},
        ),
    );
  }
}
