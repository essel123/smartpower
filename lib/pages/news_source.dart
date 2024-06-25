import 'package:flutter/material.dart';
import 'package:smartpower/pages/home_page.dart';

String message = """
I'm excited to introduce myself as a young and ambitious tech enthusiast, eager to learn and grow with your organization. With a strong foundation in software development, as an intermediate developer, I've honed my skills in delivering high-quality work, and I'm confident in my ability to make a positive impact. Looking for a dynamic environment where I can be mentored, trained, and coached to reach my full potential, I find myself in your organization as it can let me achieve all these, and will be happy to give my best to impact your organization. I'm a quick learner, a team player, and dedicated to delivering exceptional results. Thank you for considering my application. I look forward to hearing from you.
""";
HomePage homePage = const HomePage();

TextStyle _textStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 10, 1, 59),
);

TextStyle _textStyle1 = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 10, 1, 59),
);

class NewsHome extends StatelessWidget {
  // final String time;
  // final String image;
  // final String message;
  const NewsHome({
    super.key,
    // required this.time,
    // required this.image,
    // required this.message,
  });

  @override
  Widget build(BuildContext context) {
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
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 3, 55, 98),
                      radius: 30,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/profile.jpg"),
                      ),
                    ),
                    title: Text(
                      "Smart Power",
                      style: _textStyle,
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(
                          Icons.date_range_sharp,
                          size: 15,
                        ),
                        Text(
                          "2024-03-05 11pm",
                          style: _textStyle1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/2.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 20),
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 350,
                      child: Text(
                        message,
                        style: const TextStyle(
                          wordSpacing: 1,
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
