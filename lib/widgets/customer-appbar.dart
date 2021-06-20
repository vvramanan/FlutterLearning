import 'package:covid19app/core/flutter_icons.dart';
import 'package:flutter/material.dart';

class CustomerAppBarWidget extends StatefulWidget {
  const CustomerAppBarWidget({Key? key}) : super(key: key);

  @override
  _CustomerAppBarWidgetState createState() => _CustomerAppBarWidgetState();
}

class _CustomerAppBarWidgetState extends State<CustomerAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            FlutterIcons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Container(
          margin: EdgeInsets.all(16),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              image: DecorationImage(
                  image: AssetImage("assets/images/profile.jpg"))),
        ),
      ],
    );
  }
}
