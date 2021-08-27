import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karma/common/widgets/curved_body_widget.dart';
import 'package:karma/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notifsOn = true;

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: Container(),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Karma Drives",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: ThemeColors.primary,
        body: Stack(
          children: [
            CurvedBody(top: Container(), bottom: buildProfileDetails()),
            Positioned(
                top: 90 - 40,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: CircleAvatar(radius: 50))
          ],
        ));
  }

  buildProfileDetails() {
    return FutureBuilder<SharedPreferences>(
        future: _pref,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            notifsOn = snapshot.data!.getBool('notifs') ?? true;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: buildProfileText(
                          text: "Name",
                          value: snapshot.data!.getString('name')),
                    ),
                    Padding(padding: EdgeInsets.only(right: 50)),
                    Expanded(
                      child: buildProfileText(
                          text: "Phone Number",
                          value: snapshot.data!.getString('phone')),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: buildProfileText(
                          text: "Location",
                          value: snapshot.data!.getString('location')),
                    ),
                    Padding(padding: EdgeInsets.only(right: 50)),
                    Expanded(
                      child: buildProfileText(
                          text: "Interest",
                          value: snapshot.data!.getString('interest')),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notifications'),
                    CupertinoSwitch(
                        value: notifsOn,
                        onChanged: (s) {
                          setState(() {
                            snapshot.data!.setBool('notifs', s);
                            notifsOn = s;
                          });
                        }),
                  ],
                )
              ],
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: buildProfileText(text: "Name"),
                  ),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  Expanded(
                    child: buildProfileText(
                      text: "Phone Number",
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: buildProfileText(text: "Location"),
                  ),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  Expanded(
                    child: buildProfileText(text: "Interest"),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications'),
                  CupertinoSwitch(
                      value: notifsOn,
                      onChanged: (s) {
                        setState(() {
                          notifsOn = s;
                        });
                      }),
                ],
              )
            ],
          );
        });
  }

  Widget buildProfileText({required String text, String? value}) {
    return Column(
      children: [
        Align(alignment: Alignment.topLeft, child: Text('$text')),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(child: Text(value ?? "          ")),
          ),
        )
      ],
    );
  }
}
