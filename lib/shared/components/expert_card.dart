import 'package:the_consultant/models/get_all_experta_from_category.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:the_consultant/modules/details_screen.dart';
import 'package:flutter/material.dart';

class ExpertCard extends StatelessWidget {
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;
  final Data data;

  ExpertCard(this._name, this._description, this._imageUrl, this._bgColor,this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(data, _imageUrl),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _bgColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(_imageUrl),
            title: Text(
              _name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _description,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
