import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var orientation, size,height,width;
  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 1.0,),
            Text('MY WEB3 PAL', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: 24,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1
            ),),
            SizedBox(width: 1.0,),
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color : Color.fromRGBO(217, 217, 217, 1),
                  borderRadius : BorderRadius.all(Radius.elliptical(40, 40)),
                )
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          children: [
            Container(
          height: 140.0,
          child: DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                  color: Colors.black
              ),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0)
          ),
        ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  menuItem('My Alphas'),
                  SizedBox(height: 30.0,),
                ],
              ),
            ),
            Container(
              width: 180.0,
              color: Colors.white10,
              child: ExpansionTile(
                title:  Text('NFTs', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    // color: Colors.red,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                trailing: Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 33.0,
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 10.0,),
                          menuItem('WATCHLIST'),
                          SizedBox(height: 30.0,),
                          menuItem('CART'),
                          SizedBox(height: 30.0,),
                          menuItem('SCORED'),
                          SizedBox(height: 30.0,),
                          menuItem('HODDY'),
                          SizedBox(height: 30.0,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  menuItem('DEFI'),
                  SizedBox(height: 30.0,),
                  menuItem('AIRDROPS'),
                  SizedBox(height: 30.0,),
                  menuItem('GIGOOR'),
                  SizedBox(height: 30.0,),
                  menuItem('BUY LIST'),
                  SizedBox(height: 30.0,),
                  menuItem('XJOBS'),
                  SizedBox(height: 30.0,),
                  menuItem('RAFFLES'),
                  SizedBox(height: 30.0,),
                  menuItem('TO-DO'),
                  SizedBox(height: 30.0,),
                  menuItem('CALENDER'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0 , right: 15.0,top: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width:  width/1.4,
                      height:  height/13.5,

                      decoration: BoxDecoration(
                borderRadius : BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color : Color.fromRGBO(230, 230, 230, 0.20000000298023224),
                border : Border.all(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  width: 2,
                ),
              ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search_outlined,
                              // size: 30.0,
                              color: Color(0xFF3850EE),
                            ),
                            SizedBox(width: 8.0,),
                            Text('Search', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.25),
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),)

                          ],
                        ),
                      )
                  ),
                  // SizedBox(width: 18.0,),
                  Container(
                    width:  width/6.5,
                    height: height/13.5,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color : Color.fromRGBO(56, 80, 238, 1),
                      ),
                    child: SvgPicture.asset(
                      'images/filter_2.svg',
                        // semanticsLabel: 'filter2',
                        height: 8,
                        width: 8,
                        fit: BoxFit.scaleDown
                    ),
                  ),
                  // 03266691636
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,bottom: 3.0),
                child: Container(
                  width:  width/0,
                  height:  height/4.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('images/Rectangle144.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Color.fromRGBO(0, 0, 0, 0.5), // Background color for the text
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Evaluation of Web3 takes its biggest increment yet',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0,bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('News', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Inter',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                    ),),
                    Container(
                      width:  width/2.6,
                      height:  height/14.7,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.all(Radius.circular(10.0)),
                        color : Color.fromRGBO(30, 30, 30, 1),
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0 ,bottom: 4.0,),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Sort by', textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Inter',
                                fontSize: 16,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                            ),),
                            SizedBox(width : 37),
                            // Icon(Icons.arrow_drop_down_sharp)
                            Icon(Icons.keyboard_arrow_down_outlined,size: 38.0,),
                            // for down arrow
                            // Icon(Icons.keyboard_arrow_down_outlined),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        _projectCard(context , 'images/Rectangle133.png','Mints of the day'),
                        SizedBox(
                          width:  width/19.4,
                        ),
                        _projectCard(context  ,'images/Rectangle135.png','Gary gee organizes NFT event'),
                      ],
                    ),
                    Row(
                      children: [
                        _projectCard(context ,'images/Rectangle134.png' , 'DeGods NFT have secured a partnership'),
                        SizedBox(
                          width:  width/19.4,
                        ),
                        _projectCard(context ,'images/Rectangle137.png' , 'DeGods NFT have secured a partnership'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text menuItem(String title) {
    return Text(title.toString(), textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.800000011920929),
                          fontFamily: 'Inter',
                          fontSize: 16,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),);
  }
  Widget _projectCard(BuildContext context ,String image , description){
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 2.0,),
      width:  width/2.32,
      height:  height/4.1,
      // color: Colors.green,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:  width/2.3,
            height:  height/5.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 5),
                  blurRadius: 20,
                ),
              ],
              color: Color.fromRGBO(255, 255, 255, 1),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 160.0,
              padding: EdgeInsets.only(top: 0.0,bottom: 10.0),
              alignment: Alignment.bottomLeft,
              child: Text(description.toString(),
                // 'Yuga Lab Releases new project',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  // color: Colors.red,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

