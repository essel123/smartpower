import 'package:smartpower/pages/alt_wallet.dart';
import 'package:smartpower/pages/home_page.dart';
import 'package:smartpower/pages/payment.dart';
import 'package:smartpower/pages/charts_statistics.dart';
import 'package:smartpower/pages/account.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final List<Widget> screens = [
  const HomePage(),
  const WalletP(),
  const StatisticsCharts(),
  const Account()
];

final PageStorageBucket bucket = PageStorageBucket();
int selectedIndex = 0;

Widget currentscrren = screens[selectedIndex];


class _HomeState extends State<Home> {
  



 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: screens[selectedIndex],

      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 123, 105, 158),
        child: BottomAppBar(
          
          shape: const CircularNotchedRectangle(),
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
              selectedItemColor: Colors.blue,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Wallet"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.leaderboard), label: "Chart"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
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
        backgroundColor: const Color.fromARGB(255, 18, 15, 182),
        shape: const CircleBorder(),

        // Image.asset("images/transaction.png")
        child: const Center(
            child: Text(
          "Pay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
