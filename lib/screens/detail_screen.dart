import 'package:dan_resto/common/navigation.dart';
import 'package:dan_resto/components/card/cardreview.dart';
import 'package:dan_resto/components/menus/categorywidget.dart';
import 'package:dan_resto/components/menus/drinkwidget.dart';
import 'package:dan_resto/components/menus/foodwidget.dart';
import 'package:dan_resto/data/api/api_service.dart';
import 'package:dan_resto/provider/detailrestaurantprovider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dan_resto/components/button/dynamicbutton.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {

  static const routeName = '/article_screen';

  final String id ;

  const DetailScreen({required this.id});

  @override
  _DetailScreen createState() => _DetailScreen();

}

class _DetailScreen extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
        create: (_) => DetailRestaurantProvider(apiService: ApiServices(), id: widget.id),
    child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Consumer<DetailRestaurantProvider>(
          builder: (context, state, _) {
            if (state.state == DetailState.Loading) {
              return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 400,),
                      CircularProgressIndicator()
                    ],
                  )
              );
            } else {
              if (state.state == DetailState.HasData) {
                final restaurant = state.detailRestaurant;
                return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SafeArea(
                          child: Stack(
                            children: [
                              Image.network(restaurant.restaurant.getImage()),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff6B45BC),
                                    child: IconButton(
                                      icon: defaultTargetPlatform == TargetPlatform.iOS
                                          ? Icon(
                                        CupertinoIcons.back,
                                        color : Colors.white,
                                      )
                                          : Icon(
                                          Icons.arrow_back,
                                          color : Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigation.back();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child:
                            DefaultTabController(
                              length: 2,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 1,
                                child: Column(
                                  children: <Widget>[
                                    TabBar(
                                      indicatorColor: Colors.grey,
                                      labelColor: Colors.black,
                                      unselectedLabelColor: Colors.grey,
                                      tabs: <Widget>[
                                        Tab(
                                          text: "Description",
                                        ),
                                        Tab(
                                          text: "Reviews",
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: <Widget>[
                                          Container(
                                            child: Column(
                                              children: [
                                                Expanded(child: Container(
                                                  margin: EdgeInsets.only(top: 20.0),
                                                  child: Text(
                                                    restaurant.restaurant.name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 30.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),),
                                                Container(
                                                  margin: EdgeInsets.symmetric(vertical: 16.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[
                                                      Column(
                                                        children: <Widget>[
                                                          Icon(Icons.star),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            '${restaurant.restaurant.rating}',
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          Icon(Icons.house_siding),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            restaurant.restaurant.address,
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: <Widget>[
                                                          Icon(Icons.location_on),
                                                          SizedBox(height: 8.0),
                                                          Text(
                                                            restaurant.restaurant.city,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),


                                                Container(
                                                    padding: EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'About',
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 18.0,
                                                        ),
                                                        Text(
                                                          restaurant.restaurant.description,
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontFamily: 'Oxygen',
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                                                  child: Text(
                                                    'Categories',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  height: 50,
                                                  child: CategoryWidget(
                                                    categories: restaurant.restaurant.categories,
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                                                  child: Text(
                                                    'List of Menu',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                                                  child: Text(
                                                    'Drinks',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      decorationColor: Colors.deepOrange,
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  height: 50,
                                                  child: DrinkWidget(
                                                    drinks: restaurant.restaurant.menus.drinks,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 14.0,
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                                                  child: Text(
                                                    'Foods',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.underline,
                                                      decorationColor: Colors.deepOrange,
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  height: 50,
                                                  child: FoodWidget(
                                                    foods: restaurant.restaurant.menus.foods,
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: DynamicButton(restaurant: restaurant.restaurant),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child:  Container(
                                              height: 10,
                                              child: CardReview(reviews: restaurant.restaurant.customerReviews, id: restaurant.restaurant.id),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ),
                      ],
                );
              } else if (state.state == DetailState.HasError) {
                return Center(
                    child: Text('Failed to load data')
                );
              }else{
                return Center(child: Text(''),);
              }
            }
          },
        ),
      ),
    ),
    );
  }
}
