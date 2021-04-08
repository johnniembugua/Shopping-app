import 'package:flutter/material.dart';
import 'package:iron_shop/orderConfirmationPage.dart';
import 'package:iron_shop/styleScheme.dart';

class TrackOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTrackOrder(),
    );
  }
}

class MyTrackOrder extends StatefulWidget {
  @override
  _MyTrackOrderState createState() => _MyTrackOrderState();
}

class _MyTrackOrderState extends State<MyTrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderConfirmation(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Track Order',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Number 2342',
                style: headingstyle,
              ),
              Text(
                'Order Confirmed. Ready to Pick',
                style: contentStyle.copyWith(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 13,
                      top: 40,
                    ),
                    width: 4,
                    height: 400,
                    color: Colors.grey,
                  ),
                  Column(children: [
                    statefulWidget('logo', 'confirmed', true),
                    statefulWidget('tape-measure', 'Picked Up', false),
                    statefulWidget('woman', 'In process', false),
                    statefulWidget('into-the-sunset', 'Shipped', false),
                    statefulWidget('themebg', 'Delivered', false),
                  ])
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.orange,
                        )),
                    child: Text(
                      'Cancel order',
                      style: contentStyle.copyWith(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.orange,
                    ),
                    child: Text(
                      'My Orders',
                      style: contentStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        iconSize: 30,
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Track Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'View Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Profile',
          )
        ],
      ),
    );
  }

  Container statefulWidget(String img, String status, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (isActive) ? Colors.orange : Colors.white,
              border: Border.all(
                color: (isActive) ? Colors.transparent : Colors.orange,
                width: 3,
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/$img.png'),
                        fit: BoxFit.contain)),
              ),
              Text(
                status,
                style: contentStyle.copyWith(
                  color: (isActive) ? Colors.orange : Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
