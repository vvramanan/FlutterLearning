import 'package:covid19app/core/consts.dart';
import 'package:covid19app/pages/statistic-page.dart';
import 'package:covid19app/widgets/customer-appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header Elements
          Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Stack(
              children: <Widget>[
                Image.asset("assets/images/virus2.png"),
                buildHeader(),
              ],
            ),
          ),
          // Symptoms UI Elements
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Symptoms of ",
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
          Container(
            height: 95,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 15),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                buildSymptoms("assets/images/1.png", "fever"),
                buildSymptoms("assets/images/2.png", "dry cough"),
                buildSymptoms("assets/images/3.png", "headache"),
                buildSymptoms("assets/images/4.png", "breathless"),
              ],
            ),
          ),
          SizedBox(
            height: 3,
          ),
          // Prevention UI Elements
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Prevention",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                buildPrevention("assets/images/a10.png", "WASH", "hands often"),
                buildPrevention("assets/images/a4.png", "COVER", "your cough"),
                buildPrevention("assets/images/a6.png", "ALWAYS", "clean"),
                buildPrevention("assets/images/a9.png", "use", "mask"),
              ],
            ),
          ),
          // Map UI Elements
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => StatisticPage(),
                  ),
                );
              },
              child: Container(
                width: 340,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/map.png"),
                      RichText(
                        text: TextSpan(
                          text: "Cases",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "\nOverview of worldwide",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: null, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
                margin: EdgeInsets.only(right: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPrevention(
      String imagePath, String preventionText1, String preventionText2) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(
              color: Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlue,
                offset: Offset(1, 1),
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Image.asset(imagePath),
              RichText(
                text: TextSpan(
                  text: "$preventionText1\n",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: preventionText2,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          margin: EdgeInsets.only(right: 15),
        ),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }

  Widget buildSymptoms(String imagePath, String symptomName) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.mainColor.withOpacity(.05),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                blurRadius: 3,
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 15),
          child: Image.asset(imagePath),
          margin: EdgeInsets.only(right: 15),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          symptomName,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomerAppBarWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "Covid 19",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Corona Relief Fund",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "This Fund will help stop of virus spread and give to the needy.",
            style: TextStyle(
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 7),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text(
                    "DONATE NOW",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {},
                  child: Text(
                    "EMERGENCY",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
