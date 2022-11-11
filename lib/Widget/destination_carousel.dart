import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Screen/destination_screen.dart';
import '../models/destination_model.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('Top Destination',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),),
              GestureDetector(
                onTap: (){
                  print('see All');
                },
                child: Text('See All',style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),),
              )
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
              itemBuilder: (BuildContext context,int index){
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) =>DestinationScreen(
                    destination: destination,
                  )));
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15,
                        child: Container(
                          width: 200.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${destination.activities?.length}activities',
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),),
                                Text(destination.description,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0,2.0),
                              blurRadius: 6.0
                            ),
                          ]
                        ),
                        child: Stack(
                          children: [
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                    image: AssetImage(destination.imageUrl),
                                  height: 180.0,
                                  width: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 130.0,
                        // bottom: ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(destination.city,style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2
                            ),),
                           Row(
                             children: [
                               const Icon(
                                 FontAwesomeIcons.locationArrow,color: Colors.white,
                                 size: 10.0,
                               ),
                               const SizedBox(width: 5.0,),
                               Text(destination.country,style: TextStyle(color: Colors.white),)
                             ],
                           ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
              }),
        ),
      ],
    );
  }
}
