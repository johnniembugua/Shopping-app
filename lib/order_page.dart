import 'package:flutter/material.dart';
import 'package:iron_shop/homePage.dart';
import 'package:iron_shop/pickUpTime.dart';
import 'package:iron_shop/styleScheme.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyOrderPage(),
    );
  }
}

class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
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
                  builder: (context) => HomePage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Select Clothes",
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
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  categoryWidget('into-the-sunset', 'Men', true),
                  categoryWidget('phone-pod', 'Women', false),
                  categoryWidget('submarine-launch', 'Kids', false),
                  categoryWidget('tape-measure', 'others', false),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      clothWidget('logo', 'Trouser', '15'),
                      clothWidget('zipshare', 'jeans', '10'),
                      clothWidget('facebook', 'jackets', '75'),
                      clothWidget('christmas-background', 'Shirts', '12'),
                      clothWidget('into-the-sunset', 'T-Shirt', '15'),
                      clothWidget('phone-pod', 'Blazer', '10'),
                      clothWidget('tape-measure', 'coats', '13'),
                      clothWidget('themebg', 'Trouser', '8'),
                      clothWidget('CenterBackground', 'Sweater', '15'),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Your Basket',
                        style: headingstyle,
                      ),
                      Text(
                        '7 Items added',
                        style: contentStyle,
                      ),
                    ],
                  ),
                  Text(
                    '\$200',
                    style: headingstyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PickUpTime(),
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
                      'SELECT DATE & TIME',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Container clothWidget(String img, String name, String price) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/$img.png'))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: headingstyle,
                    ),
                    Text(
                      "\$price",
                      style: headingstyle.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Add Note',
                      style: contentStyle.copyWith(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$45",
                  style: headingstyle,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: gradientStyle,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '-',
                          style: headingstyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(
                          '1',
                          style: headingstyle.copyWith(fontSize: 25),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: gradientStyle,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '+',
                          style: headingstyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width * 0.75,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }

  Column categoryWidget(String img, String name, bool isActive) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: (isActive) ? null : Colors.grey.withOpacity(0.3),
            gradient: (isActive) ? gradientStyle : null,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/$img.png'),
                fit: BoxFit.contain,
              )),
            ),
          ),
        ),
        Text(
          name,
          style: headingstyle,
        ),
      ],
    );
  }
}
