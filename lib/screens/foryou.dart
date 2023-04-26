import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Foryoupage extends StatelessWidget {
  const Foryoupage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffce3f4),
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Color(0xfffce3f4),
          elevation: 0,
          leading: Icon(
            Icons.search,
            color: Color(0xff4D444C),
          ),
          title: Center(
              child: Text(
            'Now in Android',
            style: TextStyle(
                color: Color(0xff201A1B),
                fontSize: 22,
                fontWeight: FontWeight.w700),
          )),
          actions: [
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: SvgPicture.asset('assets/Profile.svg')),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 200, bottom: 10),
          child: Center(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/Error.svg')),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: const [
                      Text(
                        'Error',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff4D444C)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          ' You aren’t connected to the internet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff4D444C)),
                        ),
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
