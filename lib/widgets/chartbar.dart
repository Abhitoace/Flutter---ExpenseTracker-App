import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double amount;
  final double percentageSpend;

  ChartBar({this.label, this.amount, this.percentageSpend});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder : (ctx, constrains){
      return Column(
        children: <Widget>[
          SizedBox(height:  constrains.maxHeight * 0.025),

          Container(
            height:  constrains.maxHeight * 0.15,
            child: FittedBox(
                child: Text("$amount")),
          ),
          SizedBox(height:  constrains.maxHeight * 0.05,),
          Container(
            height: constrains.maxHeight * 0.55,
            width: constrains.maxWidth * (1/4),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.blueGrey),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentageSpend,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      border: Border.all(
                          width: 1,
                          color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:  constrains.maxHeight * 0.05,),
          Container(height:  constrains.maxHeight * 0.15,child: Text("$label")),
          SizedBox(height:  constrains.maxHeight * 0.025,),
        ],
      );
    });

  }
}
