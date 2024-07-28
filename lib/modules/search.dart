import 'package:the_consultant/language/language.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/main.dart';
import 'package:the_consultant/modules/favorites_screen.dart';
import 'package:the_consultant/shared/components/category_card.dart';
import 'package:the_consultant/shared/components/card.dart';
import 'package:the_consultant/shared/components/search_bar.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrangeColor,
        title: Text(translation(context).search),
        actions: [
          IconButton(onPressed:(){
            showSearch(context: context,
                delegate: CustomSearchDelegate());
          },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate{
  List<String> names =[
    'Anas',
    'Sleman',
    'Elaf',
    'Solaf',
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query='';
      }, icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
       close(context, null);
      }, icon: Icon(Icons.arrow_back))
    ;
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery =[];

    for(var name in names)
      {
        if(name.toLowerCase().contains(query.toLowerCase())){
          matchQuery.add(name);
        }
      }

    return
    ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context,index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      }
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery =[];
    for(var name in names)
    {
      if(name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(name);
      }
    }
    return
      ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context,index){
          var result= matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        },
      );
    throw UnimplementedError();
  }
}



