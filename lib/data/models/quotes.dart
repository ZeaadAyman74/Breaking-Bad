import 'package:equatable/equatable.dart';

class Quotes extends Equatable {
  String? quote;

  Quotes.fromJson(Map<String,dynamic>json){
   quote=json['quote'];
 }

  @override
  List<Object?> get props => [quote];

}