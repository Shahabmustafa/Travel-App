import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moives_app/Widget/destination_carousel.dart';
import 'package:moives_app/Widget/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selecteIndex = 0;
  int _currentTab = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selecteIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selecteIndex == index ? Color(0xFFD8ECF1) : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(
          _icons[index],color: _selecteIndex == index ? Theme.of(context).primaryColor : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children:  [
            const Padding(
              padding: EdgeInsets.only(left: 20.0,right: 120.0),
              child: Text(
                'What would you like to find?'
                ,style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
                ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _icons
                .asMap()
                .entries
                .map(
                      (MapEntry map) => _buildIcon(map.key)
              ).toList(),
            ),
           const SizedBox(
             height: 20.0,
           ),
           const DestinationCarousel(),
            const SizedBox(
              height: 20.0,
            ),
            HotelCarousal(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDUTB-Xgz5vK_8Jk0wXWuPAbzZbOCwUhNFKg&usqp=CAU'),
            ),
          ),
        ],
      ),
    );
  }
}
