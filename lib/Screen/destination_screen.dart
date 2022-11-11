import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moives_app/models/destination_model.dart';

import '../models/activity_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({Key? key, required this.destination}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  Text _buildRatingStars(int rating){
    String star = '';
    for(int i = 0; i < rating; i++){
      star += '⭐ ';    }
    star.trim();
    return Text(star);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0,0.2),
                      blurRadius: 6.0
                  ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                      child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover,
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: Colors.black,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    Row(
                      children: [
                        IconButton(
                            color: Colors.black,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.search)),
                        IconButton(
                            color: Colors.black,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.menu)),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.destination.city,style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2
                    ),),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationArrow,color: Colors.white,
                          size: 15.0,
                        ),
                        const SizedBox(width: 5.0,),
                        Text(widget.destination.country,style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                  bottom: 20.0,
                  child: Icon(Icons.location_on,color: Colors.white60,),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0,bottom: 15.0),
              itemCount: widget.destination.activities?.length,
                itemBuilder: (BuildContext context,int index){
                Activity activity = widget.destination.activities![index];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                    child: Text(
                                      activity.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      ),
                                ),
                                Column(
                                  children: [
                                    Text('\$${activity.price}'),
                                    Text('per pex')
                                  ],
                                )
                              ],
                            ),
                            Text(activity.type),
                            SizedBox(
                              height: 10.0,
                            ),
                            _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[0]),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[1]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15.0,
                      bottom: 20.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                        ),

                      ),
                    ),
                  ],
                );
            }),
          ),
        ],
      ),
    );
  }
}
