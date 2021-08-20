import 'package:dan_resto/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:dan_resto/model/restaurant.dart';

class DynamicButton extends StatefulWidget {
  final Restaurant restaurant;

  const DynamicButton({required this.restaurant});

  @override
  _DynamicButton createState() => _DynamicButton();

}

class _DynamicButton extends State<DynamicButton>{
  var _changeText = "Add Favorite";
  Color _buttonColor = Color(0xff6B45BC);
  Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("${widget.restaurant.menu.drinks}");
        setState(() {
          _changeText = "Saved";
          _buttonColor = Color(0xffFEDE04);
          listRestaurants.add(widget.restaurant);
          Navigator.pushNamed(context, FavoriteScreen.routeName);
        });
      },
      child: Text(
        "$_changeText",
        style: TextStyle(
          color: _textColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: _buttonColor,
      ),
    );
  }
}
