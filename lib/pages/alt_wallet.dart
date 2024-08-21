import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartpower/firebase-backend/firebase_auth_services.dart';
import 'package:smartpower/pages/widgets.dart';

class WalletP extends StatefulWidget {
  const WalletP({super.key});

  @override
  State<WalletP> createState() => _WalletPState();
}

class _WalletPState extends State<WalletP> {
  double? bill;
  late double balance;
  String current = "";
  double voltage = 0;
  double enegry = 0;
  late double billpaid;
  late double calc = 0;

  String dateTime = DateFormat.Hm().format(DateTime.now());
  String date_ = DateFormat.yMMMMd().format(DateTime.now());

  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('meter');
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref('billing');
  final DatabaseReference reference = FirebaseDatabase.instance.ref();

  NumberFormat formatter = NumberFormat('0.0000');

  String? test;

  Stream? transactions;

  gettrasactions() async {
    transactions = await AuthService().getTransactiions();
    setState(() {});
  }

  Future<void> preparebill() async {
    final snapshot = await _databaseReference.get();
    final snap = await databaseReference.get();

    if (snapshot.exists && snap.exists) {
      // Map data =  snapshot.children.;
      // data['key'] = snapshot.key;

      var getenergy = [];
      var getbill = [];

      for (var element in snapshot.children) {
        getenergy.add(element.value);
      }
      for (var element in snap.children) {
        getbill.add(element.value);
      }

      calc = getenergy[1] * 0.00545;
      double bill = getbill[1];

      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (getenergy[1] == 0) {}
        bill += calc;
        // print(bill);
        reference.child('billing/').update({'bill': 1.112});
        setState(() {
          billpaid = (bill * 10000).roundToDouble() / 10000;
          dateTime = DateFormat.Hm().format(DateTime.now());
          date_ = DateFormat.yMMMMd().format(DateTime.now());
          // print(test);
        });
      });
    }
  }

  // Future<void> fetchData() async {
  //   final snapshot = await _databaseReference.get();

  //   if (snapshot.exists) {
  //     setState(() {

  //     });
  //   }
  // }

  @override
  void initState() {
    gettrasactions();

    setState(() {
      gettrasactions();

      Timer.periodic(const Duration(seconds: 1), (timer) {
        dateTime = DateFormat.Hm().format(DateTime.now());
        date_ = DateFormat.yMMMMd().format(DateTime.now());
      });
    });
    super.initState();
  }

  // Format the time (24-hour format)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 0, 82, 1),
        automaticallyImplyLeading: false,
        title: const Text(
          "BILLING",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Rubik-medium',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // print("hello");
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // gettrasactions();
          // preparebill();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
                stream: databaseReference.onValue,
                builder: (context, AsyncSnapshot snapshot) {
                  try {
                    Map data = snapshot.data.snapshot.value;
                    data['key'] = snapshot.data.snapshot.key;
                    //  PaymentsWay(
                    //           color: const Color.fromRGBO(10, 0, 82, 1),
                    //           bill: double.parse(
                    //             formatter.format(
                    //               data['bill'],
                    //             ),
                    //           ),
                    //           balance: double.parse(
                    //             formatter.format(
                    //               data['balance'],
                    //             ),
                    //           ),
                    //           date: "$dateTime, $date_ ",
                    //         ),

                    if (snapshot.hasData &&
                        !snapshot.hasError &&
                        snapshot.data.snapshot.value != null) {
                      return Expanded(
                          flex: 3,
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) => SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          color: Color.fromRGBO(10, 0, 82, 1),
                                          // image: const DecorationImage(
                                          //   fit: BoxFit.cover,
                                          //   image: AssetImage("images/profile.jpg"),
                                          // ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 20,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Current bill",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white60,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Rubik-medium'),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "GHC ${double.parse(
                                                          formatter.format(
                                                            data['bill'],
                                                          ),
                                                        )}",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'Rubik-Italic'),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        "Balance",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white60,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Rubik-medium'),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          Center(
                                                              child:
                                                                  await showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                data['balance'] >
                                                                        0.5
                                                                    ? AlertDialog(
                                                                        title: const Text(
                                                                            "Are you sure you want to settle bill with your remaining balance?"),
                                                                        actions: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              SizedBox(
                                                                                child: ElevatedButton(
                                                                                  style: const ButtonStyle(
                                                                                      backgroundColor: WidgetStatePropertyAll(
                                                                                        Color.fromRGBO(10, 0, 82, 1),
                                                                                      ),
                                                                                      shape: WidgetStatePropertyAll(
                                                                                        RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                        ),
                                                                                      )),
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: const Center(
                                                                                    child: Text(
                                                                                      "No",
                                                                                      style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                child: ElevatedButton(
                                                                                  style: const ButtonStyle(
                                                                                      backgroundColor: WidgetStatePropertyAll(
                                                                                        Color.fromRGBO(10, 0, 82, 1),
                                                                                      ),
                                                                                      shape: WidgetStatePropertyAll(
                                                                                        RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                                        ),
                                                                                      )),
                                                                                  onPressed: () {
                                                                                    try {
                                                                                      final DatabaseReference reference = FirebaseDatabase.instance.ref();
                                                                                      // final DatabaseReference reference_ = FirebaseDatabase.instance.ref("billing");

                                                                                      if (data['bill'] >= data['balance']) {
                                                                                        reference.child("billing/").update({
                                                                                          'bill': data['bill'] - data['balance']
                                                                                        });
                                                                                        reference.child("billing/").update({
                                                                                          'balance': 0.001
                                                                                        });
                                                                                      } else if (data['balance'] >= data['bill']) {
                                                                                        reference.child('billing/').update({
                                                                                          'bill': 0.001
                                                                                        });
                                                                                        reference.child("billing/").update({
                                                                                          'balance': data['balance'] - data['bill']
                                                                                        });
                                                                                      }
                                                                                      Navigator.pop(context);
                                                                                    } catch (e) {
                                                                                      print(e);
                                                                                    }

                                                                                    //  if (data['']>= amount_) {
                                                                                    //   pay = getbill[1] - amount_;
                                                                                    //   reference
                                                                                    //       .child('billing/')
                                                                                    //       .update({'bill': pay});
                                                                                    // } else if (amount_ >= getbill[1]) {
                                                                                    //   pay = amount_ - getbill[1];
                                                                                    //   reference
                                                                                    //       .child('billing/')
                                                                                    //       .update({'bill': 0.0001});
                                                                                    //   reference.child('billing/').update(
                                                                                    // //       {'balance': pay + getbill[0]});
                                                                                    // }

                                                                                    //   setState(() {});
                                                                                    // } catch (e) {
                                                                                    //   // Handle the case where the user enters invalid input
                                                                                    //   // print('Invalid input: $e');
                                                                                    // }
                                                                                  },
                                                                                  child: const Text(
                                                                                    "Yes",
                                                                                    style: TextStyle(
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      )
                                                                    : const AlertDialog(
                                                                        title:
                                                                            Text(
                                                                          "Not enough funds",
                                                                        ),
                                                                      ),
                                                          ));
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5)),
                                                            color: Colors.white,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            child: Text(
                                                              "GHC GHC ${double.parse(formatter.format(data['balance']))} ",
                                                              style: const TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          9,
                                                                          87),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      'Rubik-Italic'),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                    backgroundColor:
                                                        Colors.green,
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "$dateTime, $date_",
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 205, 203, 203),
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Rubik-Regular',
                                                    ),
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
                                  )));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } catch (e) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // data['key'] = snapshot.data.snapshot.key;
                }),
            Expanded(
              flex: 2,
              child: StreamBuilder(
                stream: _databaseReference.onValue,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData &&
                      !snapshot.hasError &&
                      snapshot.data.snapshot.value != null) {
                    Map data = snapshot.data.snapshot.value;

                    data['key'] = snapshot.data.snapshot.key;

                    // List item = [];

                    // data.forEach(
                    //     (index, data) => item.add({"key": index, ...data}));
                    return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "METER READING",
                                  style: TextStyle(
                                    color: Color.fromRGBO(10, 0, 82, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Rubik-regular',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Voltage",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  153, 48, 48, 48),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: 'Rubik-medium'),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                            "${double.parse(formatter.format(data['voltage']))}V"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "current",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  153, 48, 48, 48),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: 'Rubik-medium'),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "${data['current']}A",
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Energy",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  153, 48, 48, 48),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: 'Rubik-medium'),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text("${data['energy']} Kw/h"),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 25,
              ),
              child: Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromRGBO(10, 0, 82, 1),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik-Regular',
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: StreamBuilder(
                stream: transactions,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && !snapshot.hasError) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.docs[index];
                          return Trans(
                            image: "images/momo.png",
                            number: "${ds['Phone']}",
                            amount: "${ds['Amount']}",
                            date: "${ds['Time']}",
                          );
                        });
                  } else {
                    return const Center(
                      child: Text("Still loadding...."),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentsWay extends StatefulWidget {
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
  State<PaymentsWay> createState() => _PaymentsWayState();
}

class _PaymentsWayState extends State<PaymentsWay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: widget.color.withOpacity(1),
            // image: const DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage("images/profile.jpg"),
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
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
                          "GHC ${widget.bill}",
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
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "GHC ${widget.balance}",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 9, 87),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Rubik-Italic'),
                            ),
                          ),
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
                      widget.date,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 205, 203, 203),
                        fontSize: 16,
                        fontFamily: 'Rubik-Regular',
                      ),
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
