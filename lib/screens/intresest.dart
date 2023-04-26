import 'dart:convert';
import 'package:app/data/peoples.dart';
import 'package:app/screens/peoples.dart';
import 'package:app/screens/topics.dart';
import 'package:app/simmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:app/data/topics.dart';
import 'package:app/data/peoples.dart';
import 'package:app/load.dart';

class Intresestpage extends StatefulWidget {
  const Intresestpage({super.key});

  @override
  State<Intresestpage> createState() => _IntresestpageState();
}

class _IntresestpageState extends State<Intresestpage> {
  bool isLoading = false;
  List<Topics> topics = [];
  Map<String, dynamic> jsonData = {};

  @override
  void initState() {
    super.initState();
    loadData();
    loadDatas();
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {});
    topics = List.of(allTopics);

    setState(() {
      isLoading = false;
    });
  }

  bool isLoad = false;
  bool isImage = false;
  List<Peoples> peoples = [];

  Future loadDatas() async {
    setState(() {
      isLoad = true;
      isImage = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {});
    peoples = List.of(allPeoples);

    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfff3edf3),
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf3),
          elevation: 0,
          leading: const Icon(
            Icons.search,
            color: Color(0xff4D444C),
          ),
          title: Center(
            child: Text(
              'Following',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                color: Color(0xff201A1B),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: Icon(
                Icons.more_vert,
                color: Color(0xff4D444C),
              ),
            ),
          ],
          bottom: const TabBar(indicatorColor: Color(0xff201A1B), tabs: [
            Tab(
              child: Text(
                'Topics',
                style: TextStyle(color: Color(0xff201A1B)),
              ),
            ),
            Tab(
              child: Text(
                'People',
                style: TextStyle(color: Color(0xff201A1B)),
              ),
            ),
          ]),
        ),
        body: SingleChildScrollView(
          child: TabBarView(children: [
            // Center(child: Text("data")),
            ListView.builder(
                itemCount: isLoading ? 5 : topics.length,
                itemBuilder: (context, index) {
                  if (isLoading) {
                    return buildFoodShimmer();
                  } else {
                    final topic = topics[index];
                    return buildFood(topic);
                  }
                }),
            ListView.builder(
                itemCount: isLoad ? 5 : peoples.length,
                itemBuilder: (context, index) {
                  if (isLoad) {
                    return buildFoodShimmers();
                  } else {
                    final peopel = peoples[index];
                    return buildFoods(peopel);
                  }
                }),
          ]),
        ),
      ),
    );
  }

  Widget buildFood(Topics topic) => Padding(
        padding: const EdgeInsets.all(30),
        child: ListTile(
            leading: SizedBox(
                height: 64, width: 64, child: SvgPicture.asset(topic.svgImage)),
            title: Text(
              topic.title,
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            trailing: SvgPicture.asset(topic.last)),
      );
  Widget buildFoods(Peoples people) => Padding(
        padding: const EdgeInsets.all(25),
        child: ListTile(
          leading: SizedBox(
              height: 64, width: 64, child: SvgPicture.asset(people.svgImage)),
          title: Text(
            people.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          subtitle: Text(
            people.discripation,
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          trailing: SvgPicture.asset(people.fin),
        ),
      );
  Widget buildFoodShimmer() => const Padding(
        padding: EdgeInsets.all(18),
        child: SizedBox(
          height: 100,
          child: ListTile(
            leading: ShimmerWidget.circular(width: 64, height: 64),
            title: ShimmerWidget.rectangular(
              width: 10,
              height: 16,
            ),
            subtitle: ShimmerWidget.rectangular(height: 14),
            trailing: ShimmerWidget.circular(width: 15, height: 15),
          ),
        ),
      );
  Widget buildFoodShimmers() => const Padding(
        padding: EdgeInsets.all(18),
        child: SizedBox(
          height: 100,
          child: ListTile(
            leading: ShimmerWidgets.circulars(width: 64, height: 64),
            title: ShimmerWidgets.rectangulars(
              width: 10,
              height: 16,
            ),
            subtitle: ShimmerWidgets.rectangulars(height: 14),
            trailing: ShimmerWidgets.circulars(width: 15, height: 15),
          ),
        ),
      );
}
