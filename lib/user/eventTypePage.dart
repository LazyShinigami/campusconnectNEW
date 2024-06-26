import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcampusconnect/commons.dart';
import 'package:newcampusconnect/models/user_model.dart';
import 'package:newcampusconnect/user/eventInfoPage.dart';
import '../models.dart';

class EventTypePage extends StatelessWidget {
  final EventsController eventsController = Get.put(EventsController());
  final String eventType;

  EventTypePage({Key? key, required this.eventType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: MyText(
          'CampusConnect',
          color: Colors.white,
          size: 25,
          spacing: 2.5,
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Obx(() {
          if (eventsController.eventsList.isEmpty) {
            return Center(
              child: MyText('No event to see here', color: Colors.white),
            );
          } else {
            return GridView.count(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              children: [
                for (int i = 0; i < eventsController.eventsList.length; i++)
                  eventTileBuilder(eventsController.eventsList[i], context)
              ],
            );
          }
        }),
      ),
    );
  }

  Widget eventTileBuilder(
      Map<String, dynamic>? eventData, BuildContext context) {
    if (eventData == null) {
      return SizedBox(); // Return a placeholder widget if eventData is null
    }

    Event event = Event(
      name: eventData['name'] ?? '',
      desc: eventData['description'] ?? '',
      date: eventData['date'] ?? '',
      driveLink: eventData['driveLink'] ?? '',
      feedback: eventData['feedback'] ?? '',
      formLink: eventData['formLink'] ?? '',
      organisation: eventData['organiserName'] ?? '',
      time: eventData['time'] ?? '',
      venue: eventData['venue'] ?? '',
      imgName: eventData['imgName'] ?? '',
    );

    // Load placeholder image if imgName is empty or not found
    final String imageUrl =
        event.imgName.isNotEmpty ? event.imgName : 'assets/images/APK.png';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EventInfoPage(event: event);
            },
          ),
        );
      },
      child: Stack(
        children: [
          // Event Image
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Text
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(90, 0, 0, 0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2.5),
                      child: MyText(
                        event.name,
                        color: Colors.white,
                        weight: FontWeight.bold,
                        spacing: 1.5,
                        size: 20,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:get/get.dart';
// import 'package:newcampusconnect/commons.dart';
// import 'package:newcampusconnect/models/user_model.dart';
// import 'package:newcampusconnect/user/eventInfoPage.dart';
// import 'package:flutter/material.dart';
// import '../models.dart';
//
// class EventTypePage extends StatelessWidget {
//   EventsController eventsController = Get.put(EventsController());
//   EventTypePage({super.key, required this.eventType});
//   final String eventType;
//
//   List<Event> eventList = [
//     Event(
//         name: 'IndusFiesta',
//         desc:
//             'abc desc long soihf osidzdlnvlsdnv w epijg weg weg wpeo gfweopg we wopg weegw w  wrpgorwg rwg wrgw rgw rg wrgrwr g w g wrg wrg wrgwr g   rgoe iheo[t hivn sdosd isdivhjsrghabc desc long soihf osidzdlnvlsdnv w epijg weg weg wpeo gfweopg we wopg weegw w  wrpgorwg rwg wrgw rgw rg wrgrwr g w g wrg wrg wrgwr g   rgoe iheo[t hivn sdosd isdivhjsrgh',
//         date: '24-01-2024',
//         driveLink: 'drive.google.com',
//         feedback: 'feedback - good bad badhiya',
//         formLink: 'formlink.com',
//         organisation: 'Abc Org',
//         time: '08:00 AM',
//         venue: 'Shantai Hall',
//         imgName: 'assets/images/cultural.webp'),
//     Event(
//         name: 'XYZ',
//         desc: 'abc desc long soihf osidvn sdosd isdivhjsrgh',
//         date: '24-01-2024',
//         driveLink: 'drive.google.com',
//         feedback: 'feedback - good bad badhiya',
//         formLink: 'formlink.com',
//         organisation: 'Abc Org',
//         time: '08:00 AM',
//         venue: 'Shantai Hall',
//         imgName: 'assets/images/cultural.webp'),
//     Event(
//         name: 'hello',
//         desc: 'abc desc long soihf osidvn sdosd isdivhjsrgh',
//         date: '24-01-2024',
//         driveLink: 'drive.google.com',
//         feedback: 'feedback - good bad badhiya',
//         formLink: 'formlink.com',
//         organisation: 'Abc Org',
//         time: '08:00 AM',
//         venue: 'Shantai Hall',
//         imgName: 'assets/images/cultural.webp'),
//     Event(
//         name: 'hi',
//         desc: 'abc desc long soihf osidvn sdosd isdivhjsrgh',
//         date: '24-01-2024',
//         driveLink: 'drive.google.com',
//         feedback: 'feedback - good bad badhiya',
//         formLink: 'formlink.com',
//         organisation: 'Abc Org',
//         time: '08:00 AM',
//         venue: 'Shantai Hall',
//         imgName: 'assets/images/cultural.webp'),
//     Event(
//         name: 'harsh',
//         desc: 'abc desc long soihf osidvn sdosd isdivhjsrgh',
//         date: '24-01-2024',
//         driveLink: 'drive.google.com',
//         feedback: 'feedback - good bad badhiya',
//         formLink: 'formlink.com',
//         organisation: 'Abc Org',
//         time: '08:00 AM',
//         venue: 'Shantai Hall',
//         imgName: 'assets/images/cultural.webp'),
//     Event(
//         name: 'bhutra',
//         desc: 'abc desc long soihf osidvn sdosd isdivhjsrgh',
//         date: '24-01-2024',
//         driveLink: 'drive.google.com',
//         feedback: 'feedback - good bad badhiya',
//         formLink: 'formlink.com',
//         organisation: 'Abc Org',
//         time: '08:00 AM',
//         venue: 'Shantai Hall',
//         imgName: 'assets/images/cultural.webp'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: MyText(
//           'CampusConnect',
//           color: Colors.white,
//           size: 25,
//           spacing: 2.5,
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
//         child: (eventList.length == 0)
//             ? Center(
//                 child: MyText('No event to see here', color: Colors.white),
//               )
//             : GridView.count(
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 crossAxisCount: 2,
//                 children: [
//                   for (int i = 0; i < eventList.length; i++)
//                     eventTileBuilder(i, context)
//                 ],
//               ),
//       ),
//     );
//   }
//
//   eventTileBuilder(int i, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return EventInfoPage(event: eventList[i]);
//             },
//           ),
//         );
//       },
//       child: Stack(
//         children: [
//           // Event Image
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(width: 01, color: Colors.white),
//               borderRadius: BorderRadius.circular(10),
//               image: DecorationImage(
//                 image: AssetImage(eventList[i].imgName),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           // Text
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: const Color.fromARGB(90, 0, 0, 0),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 2.5),
//                       child: MyText(
//                         eventList[i].name,
//                         color: Colors.white,
//                         weight: FontWeight.bold,
//                         spacing: 1.5,
//                         size: 20,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
