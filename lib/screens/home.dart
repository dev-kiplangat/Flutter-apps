import 'package:covid_19/constants.dart';
import 'package:covid_19/info_card.dart';
import 'package:covid_19/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(.03),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Toggle Menu",
          onPressed: () {},
          color: Colors.teal,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.teal,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 40, right: 10),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                InfoCard(
                  iconColor: Color(0xFFFF2D55),
                  effectedNum: 1062,
                  title: "Confirmed Cases",
                  press: () {},
                ),
                InfoCard(
                  iconColor: Color(0xFFFF9C00),
                  effectedNum: 75,
                  title: "Total Deaths",
                  press: () {},
                ),
                InfoCard(
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: 689,
                  title: "Total Recovered",
                  press: () {},
                ),
                InfoCard(
                  iconColor: Color(0xFF5856D6),
                  effectedNum: 75,
                  title: "New Cases",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Preventions",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(.7),
                          )),
                  SizedBox(
                    height: 40,
                  ),
                  BuildPreventation(),
                  SizedBox(
                    height: 40,
                  ),
                  BuildHelpCard()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BuildPreventation extends StatelessWidget {
  const BuildPreventation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      PreventionInfoCard(
        title: "Wash Hands",
        svgSrc: "hand_wash.svg",
      ),
      PreventionInfoCard(
        title: "Wear Mask",
        svgSrc: "mask.svg",
      ),
      PreventionInfoCard(
        title: "Sanitize",
        svgSrc: "cook.svg",
      ),
    ]);
  }
}

class BuildHelpCard extends StatelessWidget {
  const BuildHelpCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
                height: 130,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .4,
                  top: 20,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF60BE93),
                    Color(0xFF1B8D59),
                  ]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Dial 999 for \nMedical Help!\n\n",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    TextSpan(
                      text: "If any simptoms appear",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                      ),
                    ),
                  ]),
                )),
            Positioned(
              left: -12,
              top: -3,
              child: SvgPicture.asset(
                "assets/vectors/doctors.svg",
                height: 130,
              ),
            ),
          ],
        ));
  }
}

class PreventionInfoCard extends StatelessWidget {
  final String svgSrc;
  final String title;

  const PreventionInfoCard({
    Key? key,
    required this.svgSrc,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset('assets/vectors/$svgSrc', height: 80, width: 80),
      SizedBox(
        height: 10,
      ),
      Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: kPrimaryColor.withOpacity(.6))),
    ]);
  }
}
