import 'package:dan_resto/components/card/cardrestaurant.dart';
import 'package:dan_resto/data/api/api_service.dart';
import 'package:dan_resto/provider/restaurantprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dan_resto/components/carousel/carouselcard.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  TextEditingController _search = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiServices: ApiServices()),
      child: SingleChildScrollView(
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
                      Consumer<RestaurantProvider>(
                        builder: (context, state, _) => Container(
                          width: 350.0,
                          padding: EdgeInsets.all(0.0),
                          child: TextField(
                            controller: _search,
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
                            onChanged: (value) {
                              setState(() {
                                _searchText = value;
                              });
                              state.buildSearchRestaurant(_searchText);
                            },
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
                        padding: EdgeInsets.only(top: 20.0),
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
                        child: _searchText.isEmpty
                            ? Consumer<RestaurantProvider>(
                                builder: (context, state, _) {
                                if (state.state == ResultState.Loading) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  if (state.state == ResultState.HasData) {
                                    final restaurant = state.restaurant;
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: restaurant.restaurants.length,
                                      itemBuilder: (context, index) {
                                        final restaurantElement =
                                            restaurant.restaurants[index];
                                        return CardRestaurant(
                                            restaurant: restaurantElement);
                                      },
                                    );
                                  } else if (state.state ==
                                      ResultState.NoHasData) {
                                    return Center(
                                        child: Text('Failed to load data'));
                                  } else {
                                    return Center(
                                      child: Text('No Connection'),
                                    );
                                  }
                                }
                              })
                            : Consumer<RestaurantProvider>(
                                builder: (context, state, _) {
                                  if (state.state == ResultState.Loading) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (state.state == ResultState.HasData) {
                                      final searhRestaurant =
                                          state.searchRestaurant;
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            searhRestaurant.restaurants.length,
                                        itemBuilder: (context, index) {
                                          final restaurantElement =
                                              searhRestaurant
                                                  .restaurants[index];
                                          return CardRestaurant(
                                              restaurant: restaurantElement);
                                        },
                                      );
                                    } else if (state.state ==
                                        ResultState.NoHasData) {
                                      return Center(
                                          child: Text('Failed to load data'));
                                    } else {
                                      return Center(
                                        child: Text('No connection'),
                                      );
                                    }
                                  }
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

}
