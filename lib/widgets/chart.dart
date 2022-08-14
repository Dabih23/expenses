import 'package:expenses/models/transaction.dart';
import 'package:expenses/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> rT;
  Chart(this.rT);

  List<Map<String, Object>> get gTV {
    //создали лист из наших дней и после сделалли проверку
    //если дата полностью совпадает то к сумме добавляем цену за эту дату
    return List.generate(7, (index) {
      //генерируем лист из 7 объектов
      final weekDay = DateTime.now().subtract(Duration(days: index));
      //переменная дня по индексу
      var totalSum = 0.0;
      for (var i = 0; i < rT.length; i++) {
        if (rT[i].date.day == weekDay.day &&
            rT[i].date.month == weekDay.month &&
            rT[i].date.year == weekDay.year) {
          totalSum += rT[i].amount;
        }
      } //по ключу day доступная дата, отформатированная до дня из переменной
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    //fold позволяет изменить список на другой тип
    //0.0 - начальное значение
    //текущая вычисляемая сумма - sum и сам аргумент - element
    return gTV.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
      //сумма + сумма конкретного элемента (товара)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: gTV.map((data) {
            return Flexible(
              // fit: FlexFit.loose, переносит значения на другую строчку
              fit: FlexFit.tight, //используем только доступное пространство
              child: ChartBar(
                (data['day'].toString()),
                (data['amount'] as double),
                totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
