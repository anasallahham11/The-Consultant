part of 'get_all_expert_from_category_cubit.dart';


@immutable
abstract class GetAllExpertFromCategoryState {}

class GetAllExpertFromCategoryInitial extends GetAllExpertFromCategoryState {}
class GetAllExpertFromCategoryProcessing extends GetAllExpertFromCategoryState {}

class GetAllExpertFromCategorySuccess extends GetAllExpertFromCategoryState {
  final GetAllExpertFromCategoryModel  getAllExpertfromCategoryModel;

  GetAllExpertFromCategorySuccess({required this.getAllExpertfromCategoryModel});
}

class GetAllExpertFromCategoryFailedState extends GetAllExpertFromCategoryState {
  String errorMessage;
  GetAllExpertFromCategoryFailedState({required this.errorMessage});
}