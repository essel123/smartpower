import 'package:flutter/material.dart';
import 'package:smartpower/pages/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List time = [
  "2024-03-2 11PM",
 "2024-02-2 5PM",
  "2024-02-25 1Am",
 "2024-01-22 12:30Pm", 
];
List image = [
  "images/profile.jpg",
  "images/2.jpg",
  "images/3.jpg",
  "images/4.jpg",
];

List title = [
  "Electricity",
  "Analytical study",
  "Power blackouts",
  "Dumsor",
]; 

List subtitle = [
  "lorem ipson dola chew chaw 1",
  "lorem ipson dola chew chaw 2",
  "lorem ipson dola chew chaw 3",
 "lorem ipson dola chew chaw 4",
]; 
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Timeline",
          style: TextStyle(
            color: Color.fromARGB(255, 253, 253, 253),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.newspaper_sharp,
            color: Colors.white,
          ),
          SizedBox(
            width: 120,
          ),
        ],
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: image.length,
        itemBuilder: (context, index) {
          if(index == 0)
          {

          }
          return  News(image:image[index],time: time[index],subtitle: subtitle[index],title: title[index],);
        },
      ),
    );
  }
}
