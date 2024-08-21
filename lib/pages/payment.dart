import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:smartpower/firebase-backend/firebase_auth_services.dart';
import 'package:smartpower/pages/pagestorage.dart';
import 'package:firebase_database/firebase_database.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class Bill {
  final double bill;

  const Bill({required this.bill});
}

class _PayState extends State<Pay> {
  double radius = 15;
  Color color = Colors.grey;
  Color textcolor = Colors.black;

  TextEditingController controlerPhone_ = TextEditingController();
  TextEditingController amount = TextEditingController();
  final formkey_ = GlobalKey<FormState>();
  final AuthService auth = AuthService();

  @override
  void dispose() {
    controlerPhone_.dispose();
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controlerPhone_.text = "0532911103";

    // double billamount =  double(amo);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          const Spacer()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recharge More,",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 30, 1, 65),
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "and enjoy seamless electricity",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 30, 1, 65),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                    key: formkey_,
                    child: Column(
                      children: [
                        // TextFormField(
                        //   controller: controlerPhone_,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return "Phone *";
                        //     }

                        //     return null;
                        //   },
                        //   keyboardType: TextInputType.phone,
                        //   decoration: const InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(5),
                        //       ),
                        //     ),
                        //     label: Text("Phone"),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: amount,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Amount *";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            hintText: "Enter Amount",
                            label: Text("Amount"),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formkey_.currentState!.validate()) {
                                
                               
                                final uniqueTransRef =
                                    PayWithPayStack().generateUuidV4();

                                PayWithPayStack()
                                    .now(
                                  context: context,
                                  secretKey:
                                      "sk_test_597c203c9f905ab2780d550237d19e43faf4e86a",
                                  customerEmail: "abrahamessel156@gmail.com",
                                  reference: uniqueTransRef,
                                  currency: "GHS",
                                  amount: double.parse(amount.text),
                                  paymentChannel: ["mobile_money", "card"],
                                  metaData: {
                                    "custom_fields": [
                                      {
                                        "name": "essel apusiga",
                                        "phone": controlerPhone_.text,
                                      }
                                    ]
                                  },
                                  transactionCompleted: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Payment Successful"),
                                        content: const Text(
                                            "Your payment was successful!"),
                                        actions: [
                                          TextButton(
                                            child: const Text("OK"),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  transactionNotCompleted: () {},
                                  callbackUrl: 'https//www.google.com',
                                )
                                    .then((value) async {
                                       try {
                                    final DatabaseReference reference =
                                        FirebaseDatabase.instance.ref();
                                    final DatabaseReference reference_ =
                                        FirebaseDatabase.instance
                                            .ref("billing");

                                    final snap = await reference_.get();

                                    Map data = snap.value as Map;

                                    data['key'] = snap.key;

                                    late double pay;
                                    late double amount_;
                                    var getbill = [];

                                    for (var element in snap.children) {
                                      getbill.add(element.value);
                                    }

                                    amount_ = double.parse(amount.text);
                                    if (getbill[1] >= amount_) {
                                      pay = getbill[1] - amount_;
                                      reference
                                          .child('billing/')
                                          .update({'bill': pay});
                                    } else if (amount_ >= getbill[1]) {
                                      pay = amount_ - getbill[1];
                                      reference
                                          .child('billing/')
                                          .update({'bill': 0.0001});
                                      reference.child('billing/').update(
                                          {'balance': pay + getbill[0]});
                                    }

                                    setState(() {});
                                  } catch (e) {
                                    // Handle the case where the user enters invalid input
                                    // print('Invalid input: $e');
                                  }
                                 
                                 
                                  // String id = randomAlphaNumeric(10);
                                  Map<String, dynamic> transactions = {
                                    "Amount": amount.text,
                                    "Time":
                                        " ${DateFormat.yMMMMd().format(DateTime.now())} at ${DateFormat.Hm().format(DateTime.now())}",
                                    "Phone": "0551234987",
                                  };

                                  AuthService().addTransactions(transactions);

                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const Home(
                                              index: 1,
                                            ),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(0.0, 1.0);
                                          const end = Offset.zero;
                                          const curve = Curves.ease;

                                          final tween =
                                              Tween(begin: begin, end: end);
                                          final curvedAnimation =
                                              CurvedAnimation(
                                            parent: animation,
                                            curve: curve,
                                          );

                                          return SlideTransition(
                                            position:
                                                tween.animate(curvedAnimation),
                                            child: child,
                                          );
                                        }),
                                  );
                                });
                              }
                            },
                            style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 42, 2, 107),
                              ),
                            ),
                            child: const Text(
                              "Proceed to pay",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    InkWell(
                      onTap: () {},
                      hoverColor: Colors.transparent,
                      onLongPress: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lock,
                            size: 14,
                            color: Colors.black26,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "end-to-end encryption",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
