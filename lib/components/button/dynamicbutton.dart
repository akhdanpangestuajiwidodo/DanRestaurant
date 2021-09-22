import 'package:dan_resto/data/model/detailrestaurant.dart';
import 'package:dan_resto/data/model/listrestaurant.dart';
import 'package:dan_resto/provider/databaseprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DynamicButton extends StatefulWidget {
  final DetailRestaurant restaurant;

  const DynamicButton({required this.restaurant});

  @override
  _DynamicButton createState() => _DynamicButton();

}

class _DynamicButton extends State<DynamicButton> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          return FutureBuilder<bool>(
              future: provider.isFavorite(widget.restaurant.id),
              builder: (context, snapshot) {
                var isFavorite = snapshot.data ?? false;
                return Container(
                    child: isFavorite
                        ? ElevatedButton(
                      onPressed: () {
                        provider.deleteFavorite(widget.restaurant.id);
                      },
                      child: Text(
                        "Delete Favorite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ) :
                    ElevatedButton(
                      onPressed: () {
                        provider.addFavorite(
                          ListRestaurant.fromJson(
                            widget.restaurant.toJson()
                          )
                        );
                      },
                      child: Text(
                        "Add Favorite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff6B45BC),
                      ),
                    )
                );
              }
          );
        }
    );
  }
}
