import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 10,
          backgroundColor: const Color(0xFF1CAAC9),
          child: Center(
            child: Icon(
              Icons.gps_fixed_outlined,
              color: Colors.white,
              size: deviceWidth * 0.08,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1CAAC9),
          title: const Center(child: Text('Smart Portation')),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(height: deviceHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: deviceWidth * 0.05),
                  CircleAvatar(
                    radius: deviceWidth * 0.15,
                    backgroundImage: const AssetImage('assets/pic4.jpg'),
                  ),
                  SizedBox(width: deviceWidth * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: deviceWidth * 0.07,
                          color: const Color(0xFF1CAAC9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: deviceHeight * 0.07),
              Divider(
                thickness: 2,
                color: Colors.grey[300],
              ),
              SizedBox(height: deviceHeight * 0.05),
              Padding(
                padding: EdgeInsets.only(left: deviceWidth * 0.06),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: const Color(0xFF1CAAC9),
                          size: deviceWidth * 0.1,
                        ),
                        SizedBox(width: deviceWidth * 0.1),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.06,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Row(
                      children: [
                        Icon(
                          Icons.gps_fixed,
                          color: const Color(0xFF1CAAC9),
                          size: deviceWidth * 0.1,
                        ),
                        SizedBox(width: deviceWidth * 0.1),
                        Text(
                          'Metro Location',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.06,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Row(
                      children: [
                        Icon(
                          Icons.route,
                          color: const Color(0xFF1CAAC9),
                          size: deviceWidth * 0.1,
                        ),
                        SizedBox(width: deviceWidth * 0.1),
                        Text(
                          'optimized route',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.06,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_subway_filled,
                          color: const Color(0xFF1CAAC9),
                          size: deviceWidth * 0.1,
                        ),
                        SizedBox(width: deviceWidth * 0.1),
                        Text(
                          'MetroCrowd',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.06,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.08),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(height: deviceHeight * 0.02),
              Padding(
                padding: EdgeInsets.only(left: deviceWidth * 0.06),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: const Color(0xFF1CAAC9),
                          size: deviceWidth * 0.1,
                        ),
                        SizedBox(width: deviceWidth * 0.1),
                        Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.06,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: const Color(0xFF1CAAC9),
                          size: deviceWidth * 0.1,
                        ),
                        SizedBox(width: deviceWidth * 0.1),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.06,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.05),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Stack(
            children: [
              Container(
                height: deviceHeight,
                width: deviceWidth,
                child: Image.asset('assets/map.jpg', fit: BoxFit.fitHeight),
              )
            ],
          ),
        ),
      ),
    );
  }
}
