import 'package:the_consultant/language/language.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/main.dart';
import 'package:the_consultant/modules/favorites_screen.dart';
import 'package:the_consultant/shared/components/category_card.dart';
import 'package:the_consultant/shared/components/expert_card.dart';
import 'package:the_consultant/shared/components/search_bar.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=> FavoritesScreen(),
                              )
                          );

                        } ,
                    ),
                    Padding(
            padding: const EdgeInsets.all(3.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon:  Icon(
                Icons.language,
                color: kTitleTextColor,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  translation(context).find,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: SearchBar(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  translation(context).categories,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildCategoryList(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(children: [
                    //picture
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/images/operator.jpg"),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    // how do you feel
                    Expanded(
                      child: Column(
                        children: [
                          Text(translation(context).homep,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(translation(context).homep2,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    )
                  ]),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              //Padding(
                //padding: const EdgeInsets.symmetric(
                  //horizontal: 20,
                //),
                //child: ListView.separated(
                  //physics: NeverScrollableScrollPhysics(),
                    //shrinkWrap: true,
                    //itemBuilder: (context, index) => buildExpertCard(),
                   // separatorBuilder: (context, index) => SizedBox(height: 20,),
                 //   itemCount: 3,
               // ),
             // ),
            ],
          ),
        ),
      ),
    );
  }

  buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          CategoryCard(
            'Medical',
            'assets/icons/medical.png',
            kBlueColor,
            1
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Law',
            'assets/icons/law.png',
            kYellowColor,
            2
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Education',
            'assets/icons/education.png',
            kOrangeColor,
            3
          ),
          CategoryCard(
            'Economy',
            'assets/icons/economy.png',
            Colors.green,
            4
          ),
          SizedBox(
            width: 10,
          ),
          CategoryCard(
            'Family',
            'assets/icons/family.png',
            kVioletColor,
            5
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }


}