import 'package:flutter/material.dart';
import 'package:smartpower/pages/widgets.dart';

class WalletP extends StatefulWidget {
  const WalletP({super.key});

  @override
  State<WalletP> createState() => _WalletPState();
}

class _WalletPState extends State<WalletP> {
  Color _color = Colors.blue;
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
                  color: Color.fromARGB(255, 45, 0, 207),
                ),
                PaymentsWay(
                  color: Color.fromARGB(255, 175, 242, 6),
                ),
                PaymentsWay(
                  color: Color.fromARGB(255, 1, 96, 64),
                )
              ],
            ),
          ),

          //transactions
          Container(
              margin: const EdgeInsets.only(left: 50, top: 20, bottom: 10),
              child: const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const Column(
            children: [
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                time: "5:30 PM",
              ),
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                time: "5:30 PM",
              ),
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                time: "5:30 PM",
              ),
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                time: "5:30 PM",
              ),
              Trans(
                image: "images/momo.png",
                number: "0532911103",
                time: "5:30 PM",
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
      margin: const EdgeInsets.only(left: 25),
      width: 320,
      child: Center(
        child: Card(
          color: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(30),
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
