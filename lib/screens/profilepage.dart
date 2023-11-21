import 'package:townify/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [appThemeTop, appThemeBottom])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Profile",
            style: GoogleFonts.jost(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 45),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 15, bottom: 15, left: 15),
                          padding: const EdgeInsets.only(
                              top: 40, right: 10, bottom: 10, left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 8),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(children: const [
                            CustomProfileWidget(
                              title: 'Full Name',
                              subtitle: 'youssef',
                              icon: Icon(
                                Icons.person,
                                size: 24,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.black45,
                            ),
                            CustomProfileWidget(
                              title: 'Email',
                              subtitle: 'yousef@gmail.com',
                              icon: Icon(
                                Icons.email,
                                size: 24,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.black45,
                            ),
                            CustomProfileWidget(
                              title: 'Phone Number',
                              subtitle: '123456789',
                              icon: Icon(
                                Icons.phone,
                                size: 24,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.black45,
                            ),
                            CustomProfileWidget(
                              title: 'Work',
                              subtitle: 'Software Engineer',
                              icon: Icon(
                                Icons.work,
                                size: 24,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75.0),
                          border: Border.all(
                            width: 2.0,
                            color: const Color(0xffffffff),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x29000000),
                              offset: Offset(0, 8),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              const AssetImage('assets/images/man.jpg'),
                          backgroundColor: Colors.grey,
                          child: GestureDetector(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (_) => const ProfileImage(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3,
                    children: [
                      ExtraFeatures(
                        imageUrl: 'assets/images/file.png',
                        title: 'Files',
                        ontouch: () {},
                      ),
                      ExtraFeatures(
                        imageUrl: 'assets/images/saved.png',
                        title: 'Saved',
                        ontouch: () {},
                      ),
                      ExtraFeatures(
                        imageUrl: 'assets/images/devices.png',
                        title: 'Devices',
                        ontouch: () {},
                      ),
                      ExtraFeatures(
                        imageUrl: 'assets/images/key.png',
                        title: 'Privacy & Security',
                        ontouch: () {},
                      ),
                      ExtraFeatures(
                        imageUrl: 'assets/images/bell.png',
                        title: 'Notification Setting',
                        ontouch: () {},
                      ),
                      ExtraFeatures(
                        imageUrl: 'assets/images/faqs.png',
                        title: 'FAQs',
                        ontouch: () {},
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

// ignore: non_constant_identifier_names
Widget ExtraFeatures({
  required String title,
  required String imageUrl,
  required void Function() ontouch,
}) {
  return InkWell(
    onTap: ontouch,
    child: Ink(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(2, 8),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              imageUrl,
              height: 30,
            ),
          ),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.jost(
                  height: 1.1,
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

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 250,
        height: 280,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/man.jpg'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon})
      : super(key: key);
  final String title;
  final String subtitle;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      iconColor: Colors.black54,
      leading: icon,
      title: Text(
        title,
        style: GoogleFonts.jost(
            color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.jost(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        textAlign: TextAlign.start,
      ),
    );
  }
}
