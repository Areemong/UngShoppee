import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ungshoppee/screens/search.dart';
import 'package:ungshoppee/utility/my_constant.dart';
import 'package:dio/dio.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  // Field
  List<Widget> listBanner = List();

  // Method
  @override
  void initState() {
    super.initState();
    readBanner();
  }

  Widget group1() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: GestureDetector(
        onTap: () {
          print('fast fast food');
          routhToSearch(1);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.fastfood,
                  size: 48.0,
                  color: Colors.green.shade800,
                ),
                Text('Fast food'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void routhToSearch(int index) {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext buildContext) {
      return Search(
        index: index,
      );
    });
    Navigator.of(context).push(materialPageRoute);
  }

  Widget group2() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: GestureDetector(
        onTap: () {
          routhToSearch(2);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.lime,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                               Container(
                  child: Image.asset('images/curry.png'),
                  width: 48.0,
                  height: 48.0,
                ),
                
                Text('Curry'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget group3() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: GestureDetector(
        onTap: () {
          routhToSearch(3);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.lightBlue,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Image.asset('images/food1.png'),
                  width: 48.0,
                  height: 48.0,
                ),
                Text('Grill'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget group4() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: GestureDetector(onTap: (){
        routhToSearch(4);
      },
              child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.airline_seat_flat,
                  size: 48.0,
                  color: Colors.purple,
                ),
                Text('Bakery'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget group5() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: GestureDetector(onTap: (){
        routhToSearch(5);
      },
              child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.book,
                  size: 48.0,
                  color: Colors.cyan,
                ),
                Text('Icecream'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget group6() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: GestureDetector(onTap: (){
        routhToSearch(6);
      },
              child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.yellow,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.camera,
                  size: 48.0,
                  color: Colors.pink,
                ),
                Text('Berage'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget row1Group() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        group1(),
        group2(),
        group3(),
      ],
    );
  }

  Widget row2Group() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        group4(),
        group5(),
        group6(),
      ],
    );
  }

  Widget groupProduct() {
    return Column(
      children: <Widget>[
        row1Group(),
        row2Group(),
      ],
    );
  }

  Future<void> readBanner() async {
    Response response = await Dio().get(MyConstant().urlBanner);
    // print('response = $response');

    var result = json.decode(response.data);

    for (var map in result) {
      Widget myWidget = Container(
        child: Image.network(map['Url']),
      );
      setState(() {
        listBanner.add(myWidget);
      });
    }
  }

  Widget banner() {
    return Container(
      // color: Colors.green,
      height: 200.0,
      child: listBanner.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CarouselSlider(
              items: listBanner,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              pauseAutoPlayOnTouch: Duration(seconds: 3),
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        banner(),
        groupProduct(),
      ],
    );
  }
}
