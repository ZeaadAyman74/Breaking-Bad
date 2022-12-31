import 'package:breaking_bad/core/constants/strings.dart';
import 'package:breaking_bad/core/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';

abstract class BaseCharactersDataSource{
  Future<List<dynamic>>fetchCharacters({Map<String ,dynamic>?parameters});
  Future<List<dynamic>>getCharacterQuote(String characterName);
}



class CharactersDataSource implements BaseCharactersDataSource{
  Future<List<dynamic>>fetchCharacters({Map<String ,dynamic>?parameters})async{
   try{
     Response response= await DioHelper.getData(allCharactersPath,parameter: parameters);
     return response.data;
   }catch(e){
    print(e.toString());
     return [];
   }
  }
  Future<List<dynamic>>getCharacterQuote(String characterName)async{
    try{
     Response response=await DioHelper.getData(characterQuotePath,parameter: {'author':characterName});
     return response.data;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}