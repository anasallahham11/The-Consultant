import 'package:flutter/material.dart';
import 'package:the_consultant/bloc/blocget/get_all_expert_from_category_cubit.dart';
import 'package:the_consultant/language/language_constants.dart';
import 'package:the_consultant/models/get_all_experta_from_category.dart';
import 'package:the_consultant/shared/styles/colors.dart';
import 'package:the_consultant/shared/components/expert_card.dart';
class ExpertsScreen extends StatelessWidget {
final GetAllExpertFromCategoryModel? getAllExpertFromCategoryModel;

const ExpertsScreen({super.key, this.getAllExpertFromCategoryModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrangeColor ,
        title: Text(
          translation(context).experts,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),

        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildExpertCard(getAllExpertFromCategoryModel!.data![index]),
          separatorBuilder: (context, index) =>SizedBox(height: 20,),
          itemCount: getAllExpertFromCategoryModel!.data!.length,
        ),
      ),
    );
  }
  buildExpertCard(Data data) {
    return ExpertCard(
      data.nameEn,
      data.consultingId==1?'medical':data.consultingId==2? 'law':data.consultingId==3?'education':data.consultingId==4?'economy':'family',
      'assets/images/doctor1.png',
      kOrangeColor,
      data,
    );
  }
}