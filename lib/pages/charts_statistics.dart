
import 'package:smartpower/widget-class/bardata.dart';
import 'package:smartpower/widget-class/names.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';


class StatisticsCharts extends StatefulWidget {
  const StatisticsCharts({super.key});

  @override
  State<StatisticsCharts> createState() => _StatisticsChartsState();
}

class _StatisticsChartsState extends State<StatisticsCharts> {

    Widget valueWidget = const Day();
    double radius = 60;
    Color dayColor = const Color.fromRGBO(0, 0, 255, 100);
    Color  monthColor =  Colors.transparent;
    Color  yearColor =  Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      

      body: ListView(
        children: [
          Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Daily graph
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            dayColor = const Color.fromRGBO(0, 0, 255, 100);
                            monthColor = Colors.transparent;
                            yearColor =  Colors.transparent;
                            valueWidget = const Day();
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                              color:dayColor,
                              borderRadius: BorderRadius.circular(radius)),
                          child: const Center(
                            child: Text(
                              "Daily",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                  
                      //Monthly graph
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            dayColor = Colors.transparent;
                            monthColor = const Color.fromRGBO(0, 0, 255, 100);
                            yearColor =  Colors.transparent;
                            valueWidget = Padding(
                                  padding: const EdgeInsets.all(30),
                              child: BarChart(BarChartData(
                                  gridData: const FlGridData(show: false),
                                  borderData: FlBorderData(show: false),
                                  alignment: BarChartAlignment.spaceBetween,
                                  extraLinesData: const ExtraLinesData(),
                                  titlesData: FlTitlesData(
                                    rightTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    leftTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    topTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                          
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          String name = "";
                                          for (var i = 0;
                                              i < NamesOf.months.length;
                                              i++) {
                                            NamesOf.months[i];
                                            switch (value.toInt()) {
                                              case 0:
                                                name = NamesOf.months[0];
                                                return Text(name);
                                              case 1:
                                                name = NamesOf.months[1];
                                                return Text(name);
                                              case 2:
                                                name = NamesOf.months[2];
                                                return Text(name);
                                              case 3:
                                                name = NamesOf.months[3];
                                                return Text(name);
                                              case 4:
                                                name = NamesOf.months[4];
                                                return Text(name);
                                            }
                                          }
                                          return Text(name);
                                        },
                                      ),
                                    ),
                                  ),
                                  minY: 0,
                                  maxY: 200,
                                  barTouchData: BarTouchData(enabled: true),
                                  barGroups: Bardata.bardataMonths
                                      .map(
                                        (e) => BarChartGroupData(
                                          x: e.id,
                                          barRods: [
                                            BarChartRodData(
                                                toY: e.y,
                                                width: 20,
                                                color: const Color.fromRGBO(0, 0, 255, 100),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                )),
                                          ],
                                        ),
                                      )
                                      .toList())),
                            );
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                              color: monthColor,
                              borderRadius: BorderRadius.circular(radius)),
                          child: const Center(
                            child: Text(
                              "Monthly",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                      ),
                  
                      //Yearly graph
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            dayColor = Colors.transparent;
                            monthColor = Colors.transparent;
                            yearColor =  const Color.fromRGBO(0, 0, 255, 100);
                            valueWidget = Padding(
                                   padding: const EdgeInsets.all(30),
                              child: BarChart(BarChartData(
                                  gridData: const FlGridData(show: false),
                                  borderData: FlBorderData(show: false),
                                  alignment: BarChartAlignment.spaceBetween,
                                  titlesData: FlTitlesData(
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  leftTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    topTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          String name = "";
                                          for (var i = 0;
                                              i < NamesOf.years.length;
                                              i++) {
                                            NamesOf.months[i];
                                            switch (value.toInt()) {
                                              case 0:
                                                name = NamesOf.years[0];
                                                return Text(name);
                                              case 1:
                                                name = NamesOf.years[1];
                                                return Text(name);
                                              case 2:
                                                name = NamesOf.years[2];
                                                return Text(name);
                                              case 3:
                                                name = NamesOf.years[3];
                                                return Text(name);
                                            }
                                          }
                                          return Text(name);
                                        },
                                      ),
                                    ),
                                  ),
                                  minY: 0,
                                  maxY: 5000,
                                  barTouchData: BarTouchData(enabled: true),
                                  barGroups: Bardata.bardataYears
                                      .map(
                                        (e) => BarChartGroupData(
                                          x: e.id,
                                          barRods: [
                                            BarChartRodData(
                                                toY: e.y,
                                                width: 20,
                                                color: const Color.fromRGBO(0, 0, 255, 100),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12),
                                                )),
                                          ],
                                        ),
                                      )
                                      .toList())),
                            );
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            color:yearColor,
                            borderRadius: BorderRadius.circular(radius),
                          ),
                          child: const Center(
                            child: Text(
                              "Yearly",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      elevation: 10,
                      
                      
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(child: valueWidget),
                      )),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class Day extends StatelessWidget {
  const Day({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: BarChart(BarChartData(
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          
          alignment: BarChartAlignment.spaceBetween,
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
                sideTitles:
                    SideTitles(showTitles: false)),
            leftTitles: const AxisTitles(
                sideTitles:
                    SideTitles(showTitles: false)),
            topTitles: const AxisTitles(
                sideTitles:
                    SideTitles(showTitles: false,
                  
                    )),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
              

                getTitlesWidget: (value, meta) {
                  String name = "";
                  for (var i = 0;
                      i < NamesOf.days.length;
                      i++) {
                    NamesOf.days[i];
                    switch (value.toInt()) {
                      case 0:
                        name = NamesOf.days[0];
                        return Text(name);
                      case 1:
                        name = NamesOf.days[1];
                        return Text(name);
                      case 2:
                        name = NamesOf.days[2];
                        return Text(name);
                      case 3:
                        name = NamesOf.days[3];
                        return Text(name);
                      case 4:
                        name = NamesOf.days[4];
                        return Text(name);
                      case 5:
                        name = NamesOf.days[5];
                        return Text(name);
                      case 6:
                        name = NamesOf.days[6];
                        return Text(name);
                    }
                  }
                  return Text(name);
                },
              ),
            ),
          ),
          minY: 0,
          maxY: 100,
          barTouchData: BarTouchData(enabled: true),
          barGroups: Bardata.bardatadaily
              .map(
                (e) => BarChartGroupData(
                  x: e.id,
                  barRods: [
                    BarChartRodData(
                        toY: e.y,
                        width: 20,
                        color: const Color.fromRGBO(0, 0, 255, 100),
                        borderRadius:
                            const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        )),
                  ],
                ),
              )
              .toList())),
    );
  }
}