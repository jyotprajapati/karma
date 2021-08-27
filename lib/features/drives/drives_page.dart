import 'package:flutter/material.dart';
import 'package:karma/common/widgets/curved_body_widget.dart';
import 'package:karma/features/auth/LoginPage.dart';
import 'package:karma/features/profile/profilePage.dart';
import 'package:karma/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrivesPage extends StatefulWidget {
  const DrivesPage({Key? key}) : super(key: key);

  @override
  _DrivesPageState createState() => _DrivesPageState();
}

class _DrivesPageState extends State<DrivesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primary,
      appBar: AppBar(
        elevation: 0,
        leading: null,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  (await SharedPreferences.getInstance()).remove('token');
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                  child: Icon(
                    Icons.logout,
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
              Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side:
                                BorderSide(color: Colors.white, width: 2.0)))),
                child: Text('MY DRIVES'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ));
            },
            icon: Icon(Icons.person, color: Colors.white),
          )
        ],
      ),
      body: CurvedBody(top: buildTop(), bottom: buildBottom()),
    );
  }

  Widget buildTop() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "Search here",
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          fillColor: Colors.white),
    );
  }

  buildBottom() {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGMdehtEmSs2co2Nm_RALEwmrYeJ_9DUda2w&usqp=CAU",
                      height: 400.0,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 400,
                      width: double.infinity,
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "9,523",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    Text(
                                      "JOINED",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "CATAGORY",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "SPIRITUAL EMPOWERMENT",
                                style: TextStyle(
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "05:00 AM | 07 DEC 2019",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.lightGreen),
                                        padding: MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(vertical: 10)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.lightGreen,
                                                    width: 2.0)))),
                                    child: Text(
                                      'JOINED',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(8)),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        padding: MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(vertical: 10)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0)))),
                                    child: Text('DO KARMA'),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(
                  "https://static.toiimg.com/photo/msid-80249416,width-96,height-65.cms"),
              fit: BoxFit.scaleDown)),
    );
  }
}
