import 'package:smartpower/pages/alt_wallet.dart';
import 'package:smartpower/pages/home_page.dart';
import 'package:smartpower/pages/inquire.dart';
import 'package:smartpower/pages/payment.dart';
import 'package:smartpower/pages/charts_statistics.dart';
import 'package:smartpower/pages/account.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final int index;
  const Home({
    super.key,
    required this.index,
  });

  @override
  State<Home> createState() => _HomeState();
}

final List<Widget> screens = [
  const HomePage(),
  const WalletP(),
  const StatisticsCharts(),
  const SendMessage(),
  const Account(),
];

final PageStorageBucket bucket = PageStorageBucket();

// Widget currentscrren = screens[selectedIndex];

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  void initState() {
    setState(() {
      selectedIndex = widget.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: BottomAppBar(
          // shape: const CircularNotchedRectangle(),
          elevation: 1,
          notchMargin: 5,
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            width: double.infinity,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedItemColor: const Color.fromRGBO(10, 0, 82, 1),
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              elevation: 0,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.payment), label: "Wallet"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.leaderboard,
                    ),
                    label: "Chart"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined),
                  label: "Inquire",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Account",
                ),
              ],
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
        ),
      ),

      floatingActionButton: selectedIndex == 1
          ? Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: SizedBox(
                width: 100,
                height: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Pay(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            final tween = Tween(begin: begin, end: end);
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: curve,
                            );

                            return SlideTransition(
                              position: tween.animate(curvedAnimation),
                              child: child,
                            );
                          }));
                    });
                  },
                  backgroundColor: const Color.fromRGBO(10, 0, 82, 1),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 10,

                  splashColor: const Color.fromARGB(255, 9, 1, 79),
                  focusColor: Colors.white,

                  // Image.asset("images/transaction.png")
                  child: const Center(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_to_mobile,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            )
          : const Text(""),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
