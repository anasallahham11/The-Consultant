import 'package:dio/dio.dart';

import '../local/cache.dart';


class GetAllExpertFromCategoryWebServices{
  static late Dio dio;
  static void GetAllProductsFromCategoryWebServices(){
    BaseOptions baseOptions=BaseOptions(
        baseUrl: 'http://192.168.43.58:8080/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Accept':'application/json'
        }
    );
    dio=Dio(baseOptions);
  }
  static Future <Response>postData
      (
      {
        required  url,
        required  data
      }
      )
  async
  {

    dio.options.headers.addAll({
      'Accept': 'application/json',
        'Authorization':'${CacheHelper.getData(key: 'token')
         }'

    });
    try{
      Response response= await dio.post(
        url,
        data: data,
      );
      return response;
    }
    catch(e){
      throw Exception();
    }

  }

}