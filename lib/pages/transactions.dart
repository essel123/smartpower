import 'package:flutter/material.dart';
import 'package:smartpower/pages/widgets.dart';
import 'package:intl/intl.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  String dateTime = DateFormat.Hm().format(DateTime.now());
  String date_ = DateFormat.yMMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          
        ),
        child: RefreshIndicator(
          onRefresh: () async {},
          child: Column(
            children: [
              const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 9, 0, 49),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik-Regular',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Trans(
                    image: "images/momo.png",
                    number: "0532911103",
                    amount: "100",
                    date: "$dateTime. $date_ ",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
