import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/get_all_experta_from_category.dart';
import '../../network/remote/get_all_experts_from_category_dio.dart';


part 'get_all_expert_from_category_state.dart';
class GetAllExpertFromCategoryBloc extends Cubit<GetAllExpertFromCategoryState> {
  GetAllExpertFromCategoryBloc() : super(GetAllExpertFromCategoryInitial());
  GetAllExpertFromCategoryModel ? getAllExpertFromCategoryModel;
  static GetAllExpertFromCategoryBloc get(context) => BlocProvider.of(context);

  void getAllExpertFromCategory({

required consultingId
  }) {
    emit(GetAllExpertFromCategoryProcessing());
    GetAllExpertFromCategoryWebServices.postData(url: 'expert/page', data: {
      'consulting_id': consultingId,
    }).then((value) {

      getAllExpertFromCategoryModel=GetAllExpertFromCategoryModel.fromJson(value.data);
      if(getAllExpertFromCategoryModel!.data!.isNotEmpty)
      emit(GetAllExpertFromCategorySuccess(getAllExpertfromCategoryModel:getAllExpertFromCategoryModel! ));
    }).catchError((onError) {
      emit(GetAllExpertFromCategoryFailedState(errorMessage:onError.toString()));
    });
  }
}

