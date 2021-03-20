import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: Stack(
          children: [
            ImgBackground(),
            AppBar(width: width, height: height),
            CenterTitle(width: width),
            width > 1000 ? SocilLogo(height: height) : Container(),
            width > 1000 ? Language(height: height) : Container()
          ],
        ),
      ),
    );
  }
}

class Language extends StatelessWidget {
  const Language({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 20,
      child: Container(
        height: height * .09,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [RotateText('ENG'), RotateText('JAP')],
        ),
      ),
    );
  }
}

class RotateText extends StatelessWidget {
  String text;
  RotateText(this.text);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 1,
        child: Text(
          text != null ? text : 'ENG',
          style: TextStyle(fontWeight: FontWeight.w800),
        ));
  }
}

class SocilLogo extends StatelessWidget {
  const SocilLogo({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 20,
        bottom: 50,
        child: Container(
          width: 50,
          height: height * .2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: Data.socialLoge
                .map((e) => Container(
                      width: height > 600 ? 20 : 10,
                      height: height > 600 ? 20 : 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(e), fit: BoxFit.cover)),
                    ))
                .toList(),
          ),
        ));
  }
}

class CenterTitle extends StatelessWidget {
  const CenterTitle({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print(
                  'width = ${MediaQuery.of(context).size.width}\n height = ${MediaQuery.of(context).size.height}');
            },
            child: Text(
              'Emma Smith',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: width > 1000 ? 90 : 70),
            ),
          ),
          Container(
            width: width,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "I'm a ",
                  style: TextStyle(
                      fontSize: width>1000? 32.0:25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  width:width>1000? width * .12:width*.3,
                  height: 60,
                  alignment: Alignment.centerLeft,
                  color: Colors.red,
                  child: Center(
                    child: WavyAnimatedTextKit(
                      textStyle: TextStyle(
                          fontSize:width>1000? 32.0:25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      text: [
                        "freelancer",
                        "Desiner",
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      width: width,
      height: height * .07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Logo(width: width, height: height),
          Container(
            width: width * .5,
            height: height * .07,
            child: width > 1000
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: Data.appbarTitle
                        .map((e) => Text(
                              e,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.5,
                              ),
                            ))
                        .toList(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PopupMenuButton(
                        itemBuilder: (context) => List.generate(
                            Data.appbarTitle.length,
                            (index) => PopupMenuItem(
                                child: Text(Data.appbarTitle[index]))),
                        icon: Icon(Icons.sort),
                      )
                    ],
                  ),
          ),
        ],
      ),
    ));
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .25,
      height: height * .1,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(Data.logo),
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft)),
    );
  }
}

class ImgBackground extends StatelessWidget {
  const ImgBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 0,
        top: 0,
        child: Container(
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Data.img1), fit: BoxFit.cover),
          ),
        ));
  }
}
