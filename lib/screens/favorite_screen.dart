import 'package:dan_resto/components/card/cardrestaurant.dart';
import 'package:dan_resto/provider/databaseprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite_screen';
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
                        )),
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
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Consumer<DatabaseProvider>(
                          builder: (context, provider, child) {
                        if (provider.state == DbState.Loading) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          if (provider.state == DbState.HasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.favRestaurant.length,
                              itemBuilder: (context, index) {
                                final restaurantElement = provider.favRestaurant[index];
                                return CardRestaurant(
                                    restaurant: restaurantElement);
                              },
                            );
                          } else if (provider.state == DbState.NoHasData) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Center(
                                child: Text(
                                  provider.message,
                                ),
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'images/no_connection_image.png',
                                    width: 150,
                                    height: 200,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    provider.message,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                      }),
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
