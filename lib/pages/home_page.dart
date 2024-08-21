import 'package:flutter/material.dart';
import 'package:smartpower/pages/news_source.dart';
import 'package:smartpower/pages/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List time = [
  "2024-03-2 11PM",
  "2024-02-2 5PM",
  "2024-02-25 1AM",
  "2024-01-22 12:30PM",
];
List image = [
  "images/profile.jpg",
  "images/fake-meter.jpg",
  "images/electrocution-4.jpg",
  "images/4.jpg",
];

List title = [
  "Essel Apusiga Abraham",
  "Fake meters",
  "Man Electricuted by transformer",
  "Dumsor",
];

List subtitle = [
  "CEO & Founder of Smartpower",
  "ECG airs on fake meters",
  "Man electricuted by transformer in an atempt to steal it",
  "lorem ipson dola chew chaw 4",
];

List content = [
  """
I'm excited to introduce myself as a young and ambitious tech enthusiast, eager to learn and grow with your organization. With a strong foundation in software development, as an intermediate developer, I've honed my skills in delivering high-quality work, and I'm confident in my ability to make a positive impact. Looking for a dynamic environment where I can be mentored, trained, and coached to reach my full potential, I find myself in your organization as it can let me achieve all these, and will be happy to give my best to impact your organization. I'm a quick learner, a team player, and dedicated to delivering exceptional results. Thank you for considering my application. I look forward to hearing from you.


""",
  """
The power distributor expressed concerns about the distribution of fake meters in their operational areas, warning to clamp down on such illegality.

This follows the confiscation of substandard meters at the Dabala Checkpoint during a thorough inspection of a bus heading to Kumasi from Aflao, and also at Tech Junction in a VIP Bus. Investigations revealed that these meters were coming from Togo.

The ECG Ashanti-West General Manager, Mr Maxwell Dapaah, warned private individuals against installing their electric meters without recourse to ECG.

 He emphasised that such meters would not be captured in ECG’s system for purposes of billing and other commercial activities.
Mr. Dapaah lamented the impact of this practice on the commercial and technical operations of the company.

“It is illegal to import meters into the country and also acquire meters from other sources apart from ECG. We will take all necessary legal actions against individuals who are trying to infiltrate our network with these fake meters including those who aid them by selling or buying those meters.”

Mr Dapaah also revealed that meters installed by individual customers do not meet ECG’s meter specifications. 

“These meters are not tested and calibrated by ECG to meet the requirements stated by regulatory agencies such as the Energy Commission and the Ghana Standards Authority. Thereby posing danger such as fire outbreak, overloading and damage to transformers, resulting in prolonged outages and increased technical losses to the Company,” he said.
""",
  """
Residents of Suhyen Tuesday morning woke up to the lifeless body of the unidentified man with no physical marks of assault next to the ECG transformer.

Installations of the power distribution company have consistently been under serious attack in the Eastern Region in recent times, a situation which is largely affecting the operations of the company. Personnel from the National Disaster Management Organization (NADMO) who were informed about the unfortunate incident rushed to the scene in the company of the Koforidua Effiduase Police Divisional command to commence investigations to unravel the actual cause of death.""",
"""The event, held at the Accra Marriot Hotel on Saturday, 27th July 2024 was on the theme, “the promise of leadership; transformation, impact, growth and prosperity for all”.

The ECG Training Center was recognized based on its “remarkable strides and noteworthy success as a corporate governance and business leadership centre” as well as its “tremendous contribution in strategic leadership and vision to achieve business success, stakeholder profitability, community impact and contribution to national development”, as shared by the Organizers of the Awards program.

Additionally, the head of the ECG Training Center, in the person of Ing. Godfred Mensah was also acknowledged for being an outstanding business leader of the year in the area of training and development on the same platform.

The ECG Training Centre has poised itself to provide technical training with particular focus on electrical engineering and the energy sector as a whole. The Center provides capacity building for eligible persons within the country as well as those from some countries within the ECOWAS region."""
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
        backgroundColor: const Color.fromRGBO(10, 0, 82, 1),
        elevation: 5,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          itemCount: image.length,
          itemBuilder: (context, index) {
            if (index == 0) {}
            return InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        NewsHome(
                          image: image[index],
                          title: title[index],
                          subtitle: subtitle[index],
                          news: content[index],
                        ),
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
              },
              child: News(
                image: image[index],
                time: time[index],
                subtitle: subtitle[index],
                title: title[index],
                news: content[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
