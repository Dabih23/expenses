import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  late final String label; //день недели
  late final double spendingAmount; //расходы за неделю
  late final double spendingProc; //% расходов в конкретный день

  ChartBar(this.label, this.spendingAmount, this.spendingProc);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
                 //перевод типа без знаков после ,
          child: FittedBox(//умещает child в доступное пространство
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              //создает поле которое равно доле размера другого поля
              FractionallySizedBox(
                heightFactor: spendingProc,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
