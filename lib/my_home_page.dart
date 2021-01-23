import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iqfareez_portfolio/CONSTANTS.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Home(),
            ShortIntro(),
            Services(),
            CopyrightFooter(),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (3 / 4),
      color: Color(0xFFDFAC05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Fareez Iqmal',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 88),
          ),
          Text(
            'Engineering student | IIUM',
            textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 28),
          )
        ],
      ),
    );
  }
}

class ShortIntro extends StatelessWidget {
  const ShortIntro({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 115.0),
      child: Column(
        children: [
          Text(
            '21 years old boi & interested in you',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Currently active building app with ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100)),
              TextSpan(
                  text: 'Flutter!',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(kFlutter);
                    }),
            ]),
          )
        ],
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 90.0),
      color: Color(0xFF1D809F),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Visit my work at',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48),
          ),
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildServicesIcon(
                  title: 'GitHub',
                  description: 'My repositories',
                  icon: FontAwesomeIcons.github,
                  urlLink: kGitHubProfile),
              buildServicesIcon(
                  title: 'Google Play Store',
                  description: 'Android app download',
                  icon: FontAwesomeIcons.googlePlay,
                  urlLink: kPlayStoreDevPage)
            ],
          )
        ],
      ),
    );
  }

  Column buildServicesIcon(
      {@required String title,
      @required String description,
      @required IconData icon,
      @required String urlLink}) {
    return Column(
      children: [
        RawMaterialButton(
          onPressed: () {
            _launchURL(urlLink);
          },
          elevation: 2.0,
          fillColor: Colors.white,
          child: FaIcon(
            icon,
            semanticLabel: title,
            size: 35.0,
          ),
          padding: EdgeInsets.all(30.0),
          shape: CircleBorder(),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0),
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(
              fontWeight: FontWeight.w100, color: Colors.white, fontSize: 16.0),
        )
      ],
    );
  }
}

class CopyrightFooter extends StatelessWidget {
  const CopyrightFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Copyright © Fareez Iqmal 2021',
        textAlign: TextAlign.center,
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
