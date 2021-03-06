import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CONSTANTS.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Home(),
              ShortIntro(),
              Services(),
              Contact(),
              CopyrightFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  final Duration _typingDuration = Duration(milliseconds: 73);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF023E8A),
              Color(0xFF00B4D8),
              Color(0xFF00FF94),
            ],
            stops: [
              0,
              0.65,
              1,
            ],
          ),
          backgroundBlendMode: BlendMode.srcOver),
      height: MediaQuery.of(context).size.height * (1 / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(
                'Fareez Iqmal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 88,
                  shadows: [
                    Shadow(
                      blurRadius: 9.0,
                      color: Colors.black45,
                    )
                  ],
                ),
              ),
            ),
          ),
          DefaultTextStyle(
            style: GoogleFonts.ubuntuMono(color: Colors.white60, fontSize: 18),
            child: Center(
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText('Engineering student | IIUM',
                      speed: _typingDuration),
                  TypewriterAnimatedText('Hobbyist developer',
                      speed: _typingDuration),
                  TypewriterAnimatedText('Code nerds', speed: _typingDuration),
                  TypewriterAnimatedText('S*cks at design',
                      speed: _typingDuration),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShortIntro extends StatelessWidget {
  const ShortIntro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 115.0),
      child: Column(
        children: [
          SelectableText(
            '21 years old boi & interested in you',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Currently active building app with ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100)),
              TextSpan(
                  text: 'Flutter',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(kFlutter);
                    }),
              TextSpan(
                  text: ' and Android!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100)),
            ]),
          )
        ],
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
      color: kColourTeal,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SelectableText(
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
      {required String title,
      required String description,
      required IconData icon,
      required String urlLink}) {
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
            size: 25.0,
            color: kColourTeal,
          ),
          padding: EdgeInsets.all(30.0),
          shape: CircleBorder(),
        ),
        SizedBox(height: 8),
        SelectableText(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0),
        ),
        SizedBox(height: 8),
        SelectableText(
          description,
          style: TextStyle(
              fontWeight: FontWeight.w100, color: Colors.white, fontSize: 16.0),
        )
      ],
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContactButton(
              name: 'LinkedIn',
              icon: FontAwesomeIcons.linkedinIn,
              url: kLinkedInUrl),
          buildContactButton(
              name: 'Twitter',
              url: kTwitterUrl,
              icon: FontAwesomeIcons.twitter),
          buildContactButton(
              name: 'Instagram',
              url: kInstagramUrl,
              icon: FontAwesomeIcons.instagram),
          buildContactButton(
              name: 'Email',
              url: kEmailAddress,
              icon: FontAwesomeIcons.envelope),
        ],
      ),
    );
  }

  Padding buildContactButton(
      {required String name, required String url, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tooltip(
        message: name,
        child: RawMaterialButton(
          onPressed: () {
            _launchURL(url);
          },
          elevation: 2.0,
          fillColor: kColourTeal,
          child: FaIcon(
            icon,
            semanticLabel: name,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.all(20.0),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

class CopyrightFooter extends StatelessWidget {
  const CopyrightFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: SelectableText(
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
