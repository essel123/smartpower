import 'package:flutter/material.dart';
import 'package:smartpower/pages/widgets.dart';

class WalletP extends StatefulWidget {
  const WalletP({super.key});

  @override
  State<WalletP> createState() => _WalletPState();
}

class _WalletPState extends State<WalletP> {
  Color _color = Colors.blue;
  var refresh = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _color,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        _color = Colors.black;
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PaymentsWay(
                  color:  Color.fromRGBO(10, 0, 82, 1),
                ),
                // PaymentsWay(
                //   color: Color.fromARGB(255, 175, 242, 6),
                // ),
                // PaymentsWay(
                //   color: Color.fromARGB(255, 1, 96, 64),
                // )
              ],
            ),
          ),

          //transactions
          Container(
              margin: const EdgeInsets.only(left: 50, top: 20, bottom: 10),
              child: const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 9, 0, 49),
                  fontWeight: FontWeight.bold,
                ),
              )),
          const Column(
            children: [
              Trans(
                image: "images/momo.png",
                number: "059456789",
                amount: "600",
                date: " 28-02-24 12:30 AM",
              ),
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                amount: "500",
                date: " 23-02-24 12:30 AM",
              ),
              Trans(
                image: "images/momo.png",
                number: "056567893",
                amount: "240",
                date: " 23-02-24 12:30 AM",
              ),
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                amount: "100",
                date: " 22-01-24 01:00 PM",
              ),
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                amount: "300",
                date: " 23-02-24 12:30 AM",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PaymentsWay extends StatelessWidget {
  final Color color;
  const PaymentsWay({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: 340,
      child: Center(
        child: Card(
          color: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(15),
          )),
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "MOMO",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Balance",
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "GHC 12,000.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0532911103",
                      style: TextStyle(
                        color: Color.fromARGB(255, 205, 203, 203),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "03/24",
                      style: TextStyle(
                        color: Color.fromARGB(255, 205, 203, 203),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
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
