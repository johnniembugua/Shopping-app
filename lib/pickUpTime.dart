import 'package:flutter/material.dart';
import 'package:iron_shop/orderConfirmationPage.dart';
import 'package:iron_shop/order_page.dart';
import 'package:iron_shop/styleScheme.dart';

class PickUpTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPickUpTime(),
    );
  }
}

class MyPickUpTime extends StatefulWidget {
  @override
  _MyPickUpTimeState createState() => _MyPickUpTimeState();
}

class _MyPickUpTimeState extends State<MyPickUpTime> {
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
                builder: (context) => OrderPage(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Select Date & Time',
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick Up Date',
              style: headingstyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateWidget('Mon', '05 Apr', true),
                  dateWidget('Tue', '06 Apr', false),
                  dateWidget('Wed', '07 Apr', false),
                  dateWidget('Thur', '08 Apr', false),
                  dateWidget('Fri', '09 Apr', false),
                  dateWidget('Sat', '10 Apr', false),
                  dateWidget('Sun', '11 Apr', false),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Pick Up Time',
              style: headingstyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeWidget('08.00 AM to 10.00 AM', false),
                  timeWidget('10.00 AM to 12.00 PM', true),
                  timeWidget('12.00 PM to 02.00 PM', false),
                  timeWidget('02.00 PM to 04.00 PM', false),
                  timeWidget('04.00 PM to 06.00 PM', false),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Delivery Date',
              style: headingstyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateWidget('Wed', '08 Apr', false),
                  dateWidget('Thur', '09 Apr', false),
                  dateWidget('Fri', '10 Apr', true),
                  dateWidget('Mon', '13 Apr', false),
                  dateWidget('Tue', '14 Apr', false),
                  dateWidget('Wed', '15 Apr', false),
                  dateWidget('Thur', '16 Apr', false),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Delivery Time',
              style: headingstyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  timeWidget('08.00 AM to 10.00 AM', false),
                  timeWidget('10.00 AM to 12.00 PM', true),
                  timeWidget('12.00 PM to 02.00 PM', false),
                  timeWidget('02.00 PM to 04.00 PM', false),
                  timeWidget('04.00 PM to 06.00 PM', false),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount Payable",
                  style: headingstyle,
                ),
                Text(
                  '\$225',
                  style: headingstyle,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderConfirmation(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.1 - 5,
                decoration: BoxDecoration(
                  gradient: gradientStyle,
                ),
                child: Center(
                  child: Text(
                    'PLACE ORDER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container timeWidget(String time, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: (isActive) ? Colors.orange : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: contentStyle.copyWith(
              color: (isActive) ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Container dateWidget(String day, String date, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: (isActive) ? Colors.orange : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: contentStyle.copyWith(
              color: (isActive) ? Colors.white : Colors.black,
              fontSize: 18,
            ),
          ),
          Text(
            date,
            style: contentStyle.copyWith(
              color: (isActive) ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
