// TODO Implement this library.import 'package:townify/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townify/utils/constants.dart';

import 'chat_page.dart';

class Communicate extends StatefulWidget {
  const Communicate({Key? key}) : super(key: key);

  @override
  State<Communicate> createState() => _CommunicateState();
}

class _CommunicateState extends State<Communicate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [appThemeTop, appThemeBottom]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Communicate",
            style: GoogleFonts.jost(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TEACHERS",
                          style: GoogleFonts.jost(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          teacherProfile(
                            imageUrl: 'assets/images/female1.jpg',
                            name: 'fedi',
                            subject: 'C++',
                            ontouch: () {},
                          ),
                          teacherProfile(
                            imageUrl: 'assets/images/female.jpg',
                            name: 'feyza',
                            subject: 'Analyse',
                            ontouch: () {},
                          ),
                          teacherProfile(
                            imageUrl: 'assets/images/male.jpg',
                            name: 'youssef',
                            subject: 'Maths',
                            ontouch: () {},
                          ),
                          teacherProfile(
                            imageUrl: 'assets/images/female2.jpg',
                            name: 'anastasia',
                            subject: 'Biology',
                            ontouch: () {},
                          ),
                          teacherProfile(
                            imageUrl: 'assets/images/male1.jpg',
                            name: 'omar',
                            subject: 'Physics',
                            ontouch: () {},
                          ),
                          teacherProfile(
                            imageUrl: 'assets/images/male2.jpg',
                            name: 'walid',
                            subject: 'Chemistry',
                            ontouch: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "MESSAGES",
                          style: GoogleFonts.jost(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    teacherMsg(
                      name: "walid",
                      subTitle:
                          "Hello parents, tomorrow will holiday because of heavy rain. stay safe.",
                      time: "9:00 PM",
                      imageUrl: "assets/images/male1.jpg",
                      ontouch: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    teacherMsg(
                      name: "omar",
                      subTitle:
                          "Hello parents, monday morning 10:30 am you have parents meeting.",
                      time: "9:00 PM",
                      imageUrl: "assets/images/male.jpg",
                      ontouch: () {},
                    ),
                    const SizedBox(height: 8),
                    teacherMsg(
                      name: "feyza",
                      subTitle:
                          "Hello parents, tomorrow will holiday because of heavy rain. stay safe.",
                      time: "9:00 PM",
                      imageUrl: "assets/images/female.jpg",
                      ontouch: () {},
                    ),
                    const SizedBox(height: 8),
                    teacherMsg(
                      name: "maysa",
                      subTitle:
                          "Hello parents, monday morning 10:30 am you have parents meeting.",
                      time: "9:00 PM",
                      imageUrl: "assets/images/female1.jpg",
                      ontouch: () {},
                    ),
                    const SizedBox(height: 8),
                    teacherMsg(
                      name: "soulayma",
                      subTitle:
                          "Hello parents, monday morning 10:30 am you have parents meeting.",
                      time: "9:00 PM",
                      imageUrl: "assets/images/male2.jpg",
                      ontouch: () {},
                    ),
                    const SizedBox(height: 8),
                    teacherMsg(
                      name: "angela",
                      subTitle:
                          "Hello parents, monday morning 10:30 am you have parents meeting.",
                      time: "9:00 PM",
                      imageUrl: "assets/images/female2.jpg",
                      ontouch: () {},
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget teacherProfile({
  required String name,
  required String imageUrl,
  required String subject,
  required void Function() ontouch,
}) {
  return InkWell(
    hoverColor: Colors.grey,
    splashColor: Colors.grey,
    onTap: ontouch,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 110,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 4),
            blurRadius: 3,
          ),
        ],
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0XFFF6F1FF), Color(0XFFEDEDED)]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              subject,
              overflow: TextOverflow.clip,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              name,
              overflow: TextOverflow.clip,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget teacherMsg({
  required String name,
  required String subTitle,
  required String imageUrl,
  required String time,
  required void Function() ontouch,
}) {
  return InkWell(
    onTap: ontouch,
    child: Ink(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0XFFEDEDED),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(1, 3),
            blurRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        leading: CircleAvatar(
          radius: 28.0,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(
          name,
          style: GoogleFonts.jost(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subTitle,
          style: GoogleFonts.jost(
              color: Colors.black87,
              fontSize: 14,
              height: 1.2,
              fontWeight: FontWeight.w400),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              time,
              style: GoogleFonts.jost(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ),
  );
}
