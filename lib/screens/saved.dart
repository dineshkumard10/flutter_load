import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Savedpage extends StatelessWidget {
  const Savedpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff3edf3),
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xfff3edf3),
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Color(0xff4D444C),
          ),
          title: Center(
              child: Text(
            'Saved',
            style: TextStyle(
              color: Color(0xff201A1B),
              fontSize: 22,
            ),
          )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Icon(
                Icons.more_vert,
                color: Color(0xff4D444C),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 200, bottom: 10),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/Saved.png',
                    width: 180,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text(
                        'No saved updates',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff4D444C)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Updates you save will be stored here ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff4D444C)),
                        ),
                      ),
                      Text(
                        'to read later',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff4D444C)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
