import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp()
  ));
}

class Informations {
  String name;
  String contact;
  String facebook;
  String twitter;
  String link;

  Informations({ required this.name, required this.contact, required this.facebook, required this.twitter, required this.link });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Informations> data = [
    Informations(name: 'PNP', contact: '117', facebook: 'Phillipine National Police', twitter: '@pnppio', link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Philippine_National_Police_seal.svg/1200px-Philippine_National_Police_seal.svg.png'),
    Informations(name: 'PAGASA', contact: '(02) 8284-2828', facebook: 'DOST_pagasa', twitter: 'dost_pagasa', link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Philippine_Atmospheric%2C_Geophysical_and_Astronomical_Services_Administration_%28PAGASA%29_logo.svg/1200px-Philippine_Atmospheric%2C_Geophysical_and_Astronomical_Services_Administration_%28PAGASA%29_logo.svg.png'),
    Informations(name: 'MMDA', contact: '(02) 8882-4151', facebook: 'MMDA', twitter: '@MMDA', link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Metro_Manila_Development_Authority_%28MMDA%29.svg/1200px-Metro_Manila_Development_Authority_%28MMDA%29.svg.png'),
    Informations(name: 'DND', contact: '(+632) 8982-5600', facebook: 'Department of National Defense', twitter: '@dndphl', link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Department_of_National_Defense_-_DND_%28Philippines%29.svg/1200px-Department_of_National_Defense_-_DND_%28Philippines%29.svg.png'),
    Informations(name: 'OCD', contact: '(02) 911-5061', facebook: 'Office of Civil Defense', twitter: '@civildefensePH', link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/OCD_Logo_-_Office_of_Civil_Defense.svg/1200px-OCD_Logo_-_Office_of_Civil_Defense.svg.png'),
    Informations(name: 'AFP', contact: '6700', facebook: 'Armed Forces of the Philippines', twitter: '@TeamAFP', link: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Coat_of_arms_of_the_Armed_Forces_of_the_Philippines.svg/1200px-Coat_of_arms_of_the_Armed_Forces_of_the_Philippines.svg.png')
  ];

  createAlertDialog(BuildContext context, data){
      return showDialog(context: context, builder: (context) => CupertinoAlertDialog(
          title: Text('Information'),
          content: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image(image: NetworkImage('${data.link}')),
                Text('${data.name}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text('Contact: ${data.contact}'),
                Text('Facebook: ${data.facebook}'),
                Text('Twitter: ${data.twitter}'),
              ],
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('Close'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        )
      );
  }

  Widget dataTemplate(data){
      return GestureDetector(
        onTap: () => createAlertDialog(context, data),
        child: Card(
        margin: EdgeInsets.all(10),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image(
                      image: NetworkImage('${data.link}'),
                      height: 50,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${data.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('${data.contact}'),
                        Text('${data.facebook}'),
                        Text('${data.twitter}'),
                      ],
                    )
                  )
                ],
              ),
            )
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity 7 and 8 - YAP'),
        centerTitle: true,
      ),
      body: Column(
        children: data.map((data) => dataTemplate(data)).toList(),
      ),
    );
  }
}