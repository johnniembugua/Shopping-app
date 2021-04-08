import 'package:flutter/material.dart';

import 'loginPage.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyOnboarding(),
    );
  }
}

class MyOnboarding extends StatefulWidget {
  @override
  _MyOnboardingState createState() => _MyOnboardingState();
}

class _MyOnboardingState extends State<MyOnboarding> {
  int currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage('assets/images/Screenshot.png'),
            // )),
          ),
          //! dont uncomment the lines
          //TODO: Come uncomment the lines
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage(
                      "bg",
                      "Choose Clothes",
                    ),
                    onBoardPage(
                      "logo",
                      "Schedule Pickup",
                    ),
                    onBoardPage(
                      "bg",
                      "Get best iron services",
                    ),
                    onBoardPage(
                      "bg",
                      "Pay Later",
                    ),
                    onBoardPage(
                      "bg",
                      "Get on Time Delivery",
                    ),
                  ],
                  onPageChanged: (value) => {
                    setCurrentPage(value),
                  },
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) => getIndicator(index)))
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: changePage,
              child: Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xfff3953b), Color(0xffef7509)],
                    stops: [0, 1],
                    begin: Alignment.topCenter,
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changePage() {
    if (currentPage == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      _pageController.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: (currentPage == pageNo) ? Colors.orange : Colors.grey),
    );
  }

  Column onBoardPage(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/$img.png'))),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'pacifico',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          child: Text(
            'Lolem ilipsum is the basics of the printing and typesetting industry',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
