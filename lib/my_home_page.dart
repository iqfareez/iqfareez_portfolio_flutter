import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(30.0),
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
                  style: TextStyle(fontSize: 20)),
              TextSpan(
                  text: 'Flutter!',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL('https://flutter.dev/');
                    }),
            ]),
          )
        ],
      ),
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
