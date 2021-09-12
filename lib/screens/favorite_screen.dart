import 'package:dan_resto/data/model/detailrestaurant.dart';
import 'package:flutter/material.dart';

List<DetailRestaurant> listRestaurants = [];

class FavoriteScreen extends StatefulWidget {

  static const routeName = '/favorite_screen';

  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  List<DetailRestaurant> _listRestaurantsNew = listRestaurants;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 900,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  width: 64,
                                  height: 64,
                                ),
                                SizedBox(
                                  height: 24.0,
                                ),
                                Text(
                                  "Favorite Restaurant",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: _listRestaurantsNew.isNotEmpty ?ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          final DetailRestaurant restaurant = _listRestaurantsNew[index];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child:
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              margin: EdgeInsets.only(bottom: 20),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                      child: Image.network(
                                          restaurant.getImage()),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                          Text("by ${restaurant.city}"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              print(listRestaurants.removeAt(index));
                                              setState(() {
                                                _listRestaurantsNew;
                                              });
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                            ),
                                          ),
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
                        itemCount: listRestaurants.length,
                      ) : Center(child: Text('Favorite Restaurant is empty'),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
