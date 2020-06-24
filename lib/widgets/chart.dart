import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chartbar.dart';
import '../modals/chartdata.dart';
import '../modals/transaction.dart';

class Chart extends StatelessWidget{

  final List<Transaction> allTransaction;

  Chart(this.allTransaction);

  List<ChartData> get weeksTransaction{
    return List.generate(7, (index){

      final weekday = DateTime.now().subtract(Duration(days: index));
      var daySum = 0.0;
      String initial = DateFormat.E().format(weekday).substring(0,1);

      for(var i=0; i<allTransaction.length; i++){
        if(
        allTransaction[i].date.day == weekday.day||
        allTransaction[i].date.month == weekday.month||
        allTransaction[i].date.year == weekday.year
        ){
          daySum = daySum + allTransaction[i].amount;
        }
      }
      print("${DateFormat.E().format(weekday)}-$daySum");
      return ChartData(weekDay: initial, dayAmt: daySum );
    }).toList();
  }

  double get weekTotal{
    return weeksTransaction.fold(0.0, (sum, item){
      return sum += item.dayAmt;
    });
  }

  @override
  Widget build(BuildContext context){

    return  Card(
      color: Theme.of(context).primaryColor,
      elevation: 5,
      child: Container(
        height: 150,
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weeksTransaction.map((data){
            return Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ChartBar(
                  label: data.weekDay,
                  amount: data.dayAmt,
                  percentageSpend: weekTotal == 0.0 ? 0.0 : data.dayAmt/weekTotal,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}