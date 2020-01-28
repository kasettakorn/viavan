import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viavan/models/schools.dart';
import 'package:viavan/services/service_locator.dart';
import 'package:viavan/services/calls_and_messages_service.dart';




class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<SchoolResult> schools;

  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = "123456789";
  final String email = "dancamdev@example.com";
  _HomePageState() {
    Future<String> schoolJson = rootBundle.loadString('json/schools.json');
    schoolJson.then((value) {
      schools = schoolResultBangkokFromJson(value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Schools")),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.directions_subway, size: 80, color: Colors.white,),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "ViaVan",
                                style: TextStyle(color: Colors.white, fontSize: 24,),
                              ),
                              Text(
                                "Van for everyone",
                                style: TextStyle(color: Colors.white, fontSize: 18,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 40,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Profile",
                      )),
                  ListTile(
                      leading: Icon(
                        Icons.question_answer,
                        size: 40,
                        color: Colors.black,
                      ),
                      title: Text("How to use")),
                  ListTile(
                    onTap: () { Navigator.pushNamed(context, '/'); },
                      leading: Icon(
                        Icons.directions_run,
                        size: 40,
                        color: Colors.red,
                      ),
                      title: Text("Sign out")),
                  
                  
                ],

              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,

                  child: Container(

                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                       Text("2019 \u00a9 All right reserved"),
                        Text("Ronnakorn  Hompoa"),
                      ],
                    ),
                  ),
              ),
            ),
          ],
        ),

      ),
      body: ListView(
        children: <Widget>[
          (schools != null)
              ? Column(
                  children: schools.getRange(0, 10).map((school) {
                    return Card(

                      child: ListTile(
                          title: Text(school.schoolName),
                          onTap: () {
                            print("tap");
                          },
                          leading: Icon(
                            Icons.school,
                            size: 50,
                            color: Colors.black,
                          ),
                          subtitle: Text(school.district.toString() +
                              "\nโทร. " +
                              school.telephone.toString()),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: Colors.green,
                              size: 30,
                            ),
                            onPressed: () {
                              print("call");
                              _service.call(school.telephone);
                            },
                          )),
                    );
                  }).toList(),
                )
              : Container()
        ],
      ),
    );
  }
}
