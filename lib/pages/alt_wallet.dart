import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartpower/pages/widgets.dart';

class WalletP extends StatefulWidget {
  const WalletP({super.key});

  @override
  State<WalletP> createState() => _WalletPState();
}

class _WalletPState extends State<WalletP> {
  double? bill;
  double? balance;
  double? current;
  double? voltage;
  double? power;
  String dateTime = DateFormat.Hm().format(DateTime.now());
  String date_ = DateFormat.yMMMMd().format(DateTime.now());

  // Format the time (24-hour format)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            dateTime = DateFormat.Hm().format(DateTime.now());
            date_ = DateFormat.yMMMMd().format(DateTime.now());
          });
        },
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    PaymentsWay(
                      color: const Color.fromRGBO(10, 0, 82, 1),
                      bill: 1000,
                      balance: 300,
                      date: "$dateTime, $date_ ",
                    ),
                    MeterReading(
                      current: 50,
                      power: 230,
                      voltage: 220,
                      color: Colors.black,
                      date: "$dateTime, $date_ ",
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),

            //transactions
            Container(
                margin: const EdgeInsets.only(left: 50, top: 20, bottom: 10),
                child: const Text(
                  "Transactions",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 9, 0, 49),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik-Regular'),
                )),
            Column(
              children: [
                Trans(
                  image: "images/momo.png",
                  number: "059456789",
                  amount: "600",
                  date: "$dateTime. $date_ ",
                ),
                Trans(
                  image: "images/momo.png",
                  number: "0532911103",
                  amount: "500",
                  date: "$dateTime. $date_ ",
                ),
                Trans(
                  image: "images/momo.png",
                  number: "056567893",
                  amount: "240",
                  date: "$dateTime. $date_ ",
                ),
                Trans(
                  image: "images/momo.png",
                  number: "0532911103",
                  amount: "100",
                  date: "$dateTime. $date_ ",
                ),
                Trans(
                  image: "images/momo.png",
                  number: "0532911103",
                  amount: "300",
                  date: "$dateTime. $date_ ",
                ),
                Trans(
                  image: "images/momo.png",
                  number: "0532911103",
                  amount: "100",
                  date: "$dateTime. $date_ ",
                ),
                Trans(
                  image: "images/momo.png",
                  number: "0532911103",
                  amount: "300",
                  date: "$dateTime. $date_ ",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PaymentsWay extends StatelessWidget {
  final Color color;
  final double bill;
  final double balance;
  final String date;
  const PaymentsWay({
    super.key,
    required this.color,
    required this.bill,
    required this.balance,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
      ),
      width: 340,
      child: Center(
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color.withOpacity(0.7),
              // image: const DecorationImage(
              //   fit: BoxFit.cover,
              //   image: AssetImage("images/profile.jpg"),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const Text(
                        "BILLING",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Rubik-medium',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Current bill",
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Rubik-medium'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "GHC $bill",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Rubik-Italic'),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Balance",
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                fontFamily: 'Rubik-medium'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "GHC $balance",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Rubik-Italic'),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   "0532911103",
                      //   style: TextStyle(
                      //     color: Color.fromARGB(255, 205, 203, 203),
                      //     fontSize: 16,
                      //   ),
                      // ),
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 205, 203, 203),
                            fontSize: 16,
                            fontFamily: 'Rubik-Regular'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MeterReading extends StatelessWidget {
  final Color color;
  final double voltage;
  final double current;
  final double power;
  final String date;
  const MeterReading({
    super.key,
    required this.color,
    required this.current,
    required this.voltage,
    required this.power,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: 340,
      height: 225,
      child: Center(
        child: Card(
          color: color.withOpacity(0.7),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Text(
                      "METER READING",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Rubik-Medium'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Voltage",
                          style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Rubik-medium'),
                        ),
                        Text(
                          "Current",
                          style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Rubik-medium'),
                        ),
                        Text(
                          "Power",
                          style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Rubik-medium'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "$voltage V",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Rubik-Italic'),
                        ),
                        Text(
                          "$current A",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Rubik-Italic'),
                        ),
                        Text(
                          "$power KW/h",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Rubik-Italic'),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //   "0532911103",
                    //   style: TextStyle(
                    //     color: Color.fromARGB(255, 205, 203, 203),
                    //     fontSize: 16,
                    //   ),
                    // ),
                    const Spacer(),
                    Text(
                      date,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 205, 203, 203),
                          fontSize: 16,
                          fontFamily: 'Rubik-Regular'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
