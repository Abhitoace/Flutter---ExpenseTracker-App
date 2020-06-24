import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function transAdd;

  AddTransaction(this.transAdd);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

//  var price=99.012334554;
//  price = price.toStringAsFixed(2)
  void _submit() {
    String titleEntered = _titleController.text;
    double amtEntered = double.parse(_amountController.text);
    amtEntered = double.parse((amtEntered).toStringAsFixed(2));

    if (titleEntered.isEmpty || amtEntered <= 0 || _selectedDate == null) {
      return;
    }

    widget.transAdd(
      titleEntered,
      amtEntered,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

   void _datePicker(){

    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.utc(2020),
        lastDate: DateTime.now()
    ).then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
   }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom : MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleController,
                onSubmitted: (_) => _submit(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submit(),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                    color: Theme.of(context).accentColor,
                    height: 25,
                    width: 100,
                    child: _selectedDate == null ? Text("Choose a date") : FittedBox(child: Text("Date : ${DateFormat.yMd().format(_selectedDate)}")),
                  ),
                  FlatButton(
                    child: Text(
                      "Date Picker",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: _datePicker,
                  )
                ],
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  "ADD TRANSACTION",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
