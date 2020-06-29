import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:virtual_world/utils/constants.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnBoardingPagetate createState() => new _OnBoardingPagetate();
}

class _OnBoardingPagetate extends State<OnBoardingPage> {
  //Create a list of PageModel to be set on the onBoarding Screens.
  final pageList = [
    PageModel(
        color: AppColor.homePageAppBarColor,
        heroAssetPath: 'assets/images/ve.png',
        title: Text('Virtual Experience',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'Experience the new way of exploring your favourite places virtually.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/k.svg'),
    PageModel(
        color: Colors.orange,
        heroAssetPath: 'assets/images/sd.jpg',
        title: Text('Be Safe',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text(
            'Be a responsible citizen following the social distancing norms.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/k.svg'),
    PageModel(
      color: Colors.blueAccent,
      heroAssetPath: 'assets/images/am.jpg',
      title: Text('Ambience',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 34.0,
          )),
      body: Text('Enjoy with the ambience of mesmerizing sounds.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
      iconAssetPath: 'assets/images/k.svg',
    ),
    // SVG Pages Example
    PageModel(
        color: Colors.red,
        heroAssetPath: 'assets/images/ex.jpg',
        title: Text('Explore',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: Text('Explore the destination before you plan the trip.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconAssetPath: 'assets/images/k.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/homePage'),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/homePage'),
      ),
    );
  }
}
