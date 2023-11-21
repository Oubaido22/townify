import 'package:townify/utils/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatAdmin extends StatefulWidget {
  const ChatAdmin({Key? key}) : super(key: key);

  @override
  State<ChatAdmin> createState() => _ChatAdminState();
}
// i love u jihad

class _ChatAdminState extends State<ChatAdmin> {
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
          title: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white70,
                backgroundImage: AssetImage("assets/images/male1.jpg"),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Administration",
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "online",
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              splashRadius: 26,
              icon: const Icon(
                Icons.phone,
              ),
              iconSize: 30,
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {},
              splashRadius: 26,
              icon: const Icon(
                Icons.more_vert,
              ),
              iconSize: 30,
            )
          ],
        ),
        body: Column(
          children: [
            const Spacer(),
            Container(
              // color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white, //<-- SEE HERE
                    child: IconButton(
                      splashRadius: 26,
                      icon: const Icon(
                        EvaIcons.attach,
                        color: appThemeBottom,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const TextField(
                        textInputAction: TextInputAction.send,
                        textCapitalization: TextCapitalization.sentences,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white, //<-- SEE HERE
                    child: IconButton(
                      splashRadius: 26,
                      icon: const Icon(
                        EvaIcons.micOutline,
                        color: appThemeBottom,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      splashRadius: 26,
                      icon: const Icon(
                        EvaIcons.paperPlane,
                        color: appThemeBottom,
                        size: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
