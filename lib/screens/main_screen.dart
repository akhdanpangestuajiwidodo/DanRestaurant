import 'package:dan_resto/data/model/restaurant.dart';
import 'package:dan_resto/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dan_resto/components/carousel/carouselcard.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          "Dan Resto",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xffFEDE04),
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 350.0,
                      padding: EdgeInsets.all(0.0),
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: "Search the restaurant",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color(0xff3E3F55).withOpacity(0.4),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(
                                color: Color(0xff3E3F55).withOpacity(0.4),
                                width: 0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                color: Color(0xff3E3F55).withOpacity(0.4),
                                width: 0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      margin: EdgeInsets.only(top: 60.0),
                      child: Text(
                        "Promotion",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: CarouselCard(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 300,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 30, bottom: 0),
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "List of Restaurant",
                        style: TextStyle(
                          color: Color(0xff393E5B),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      height: 350,
                      child: FutureBuilder<String>(
                        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
                        builder: (context, snapshot) {
                          final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
                          return (snapshot.hasData || snapshot.data != null)
                              ?ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              final Restaurant restaurant = restaurants[index];
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  margin: EdgeInsets.only(bottom: 20),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          child: Image.network(
                                              restaurant.urlPicture),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                restaurant.name,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Location : ${restaurant.city}",
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  "Rating : ${restaurant.rating}"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              OutlinedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context, DetailScreen.routeName,
                                                      arguments: restaurant);
                                                },
                                                child: Text(
                                                  "Detail",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: Color(0xffFEDE04),
                                                  side: BorderSide(color: Color(0xffFEDE04), width: 0),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 9,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: restaurants.length,
                          ) : Center(child: Text('No Data Found'),);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
