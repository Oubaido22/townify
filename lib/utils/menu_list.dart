import 'package:townify/screens/intro_screens/login.dart';
import 'package:townify/utils/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            ),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [appThemeTop, appThemeBottom])),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('assets/images/man.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'youssef',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'youssef@gmail.com',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.person_outline_rounded,
              color: Color(0xC9000000),
            ),
            title: Text(
              'Account',
              textAlign: TextAlign.start,
              style: GoogleFonts.jost(
                  color: const Color(0xC9000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.child_care,
              color: Color(0xC9000000),
            ),
            title: Text(
              'Children',
              textAlign: TextAlign.start,
              style: GoogleFonts.jost(
                  color: const Color(0xC9000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black45,
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.help_outline_rounded,
              color: Color(0xC9000000),
            ),
            title: Text(
              'FAQs',
              textAlign: TextAlign.start,
              style: GoogleFonts.jost(
                  color: const Color(0xC9000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              Icons.bug_report_outlined,
              color: Color(0xC9000000),
            ),
            title: Text(
              'Report Bugs',
              textAlign: TextAlign.start,
              style: GoogleFonts.jost(
                  color: const Color(0xC9000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            leading: const Icon(
              EvaIcons.logOutOutline,
              color: Color(0xC9000000),
            ),
            title: Text(
              'Logout',
              textAlign: TextAlign.start,
              style: GoogleFonts.jost(
                  color: const Color(0xC9000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Image.asset(
                'assets/images/color_full.png',
                height: 50,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'App Version - v 1.0.0',
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                    color: const Color(0xC9000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
