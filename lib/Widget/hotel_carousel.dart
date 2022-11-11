import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moives_app/models/hotel_model.dart';

import '../models/destination_model.dart';

class HotelCarousal extends StatefulWidget {
  const HotelCarousal({Key? key}) : super(key: key);

  @override
  State<HotelCarousal> createState() => _HotelCarousalState();
}

class _HotelCarousalState extends State<HotelCarousal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('Exclusive Hotels',
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
              itemCount: hotels.length,
              itemBuilder: (BuildContext context,int index){
                Hotel hotel = hotels[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15,
                        child: Container(
                          width: 220.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${hotel.name}activities',
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(hotel.address,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                                Text('\$${hotel.price} / night',style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),)
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            image: AssetImage(hotel.imageUrl),
                            height: 180.0,
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
