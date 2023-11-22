import 'package:townify/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townify/database/user.dart';

class Attendence extends StatefulWidget {
  const Attendence({Key? key}) : super(key: key);

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  late Future<List<Map<String, dynamic>>> businesses;

  @override
  void initState() {
    super.initState();
    businesses = getallbusiness();
  }

  void _addToFavorites(Map<String, dynamic> business) {
    // Implement the functionality to add a business to favorites here
    print('Adding to favorites: ${business['name']}');
  }

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
            "Attendence",
            style: GoogleFonts.jost(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: businesses,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final business = snapshot.data![index];
                    return ListTile(
                      title: Text(business['name']),
                      subtitle: Text(business['category']),
                      trailing: IconButton(
                        icon: Icon(Icons.star_border),
                        onPressed: () => _addToFavorites(business),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
