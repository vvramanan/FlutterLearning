import 'package:covid19app/core/consts.dart';
import 'package:covid19app/core/flutter_icons.dart';
import 'package:covid19app/widgets/customer-appbar.dart';
import 'package:covid19app/widgets/donut-charts.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    // Basic Scaffold Container set background color
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // Stack widget to overlay background image and menu bar and header of the page top of each others
      body: Stack(
        children: <Widget>[
          // Banner background color
          Container(
            child: Image.asset("assets/images/virus2.png"),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          // Contents of the page
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomerAppBarWidget(),
                // Add Header text to the page
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "STATISTICS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // Adding Row for Active, Confirmed and Death.
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 140,
                            height: 140,
                            child: DonutPieChart.withSampleData(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildStatisticItem("Active :", "23.254", Colors.blue),
                          buildStatisticItem(
                              "Recovered :", "54.965", Colors.green),
                          buildStatisticItem("Death :", "1.254", Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Add Male, Female and transgender
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      buildGender("Male", "50%", FlutterIcons.male,
                          Colors.orangeAccent),
                      SizedBox(
                        width: 15,
                      ),
                      buildGender("Female", "49%", FlutterIcons.female,
                          Colors.pinkAccent),
                      SizedBox(
                        width: 15,
                      ),
                      buildGender("Transgender", "1%", FlutterIcons.transgender,
                          Colors.purpleAccent),
                    ],
                  ),
                ),
                // Global cases of Covid-19
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Global Cases of ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      children: [
                        TextSpan(
                          text: "Covid 19",
                          style: TextStyle(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Image.asset("assets/images/map.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGender(String gender, String percentageValue, IconData icon,
      MaterialAccentColor iConColor) {
    return Container(
      width: 95,
      height: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            gender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(percentageValue),
          Icon(
            icon,
            color: iConColor,
            size: 50,
          ),
        ],
      ),
    );
  }

  Widget buildStatisticItem(
      String title, String value, MaterialColor paramColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          FlutterIcons.label,
          size: 40,
          color: paramColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: paramColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              value,
            ),
          ],
        ),
      ],
    );
  }
}
