import 'package:equatable/equatable.dart';

class CharactersModel extends Equatable{
  int? charId;
  String? name;
  String? birthday;
  List<String>? jobs;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance=[];

  CharactersModel(
      {this.charId,
        this.name,
        this.birthday,
        this.jobs,
        this.img,
        this.status,
        this.nickname,
        this.appearance,
        this.portrayed,
        this.category,
         this.betterCallSaulAppearance});

  CharactersModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    jobs = json['occupation'].cast<String>();
    img = (json['char_id']==14 || json['char_id']==17)?'https://scontent.fcai20-3.fna.fbcdn.net/v/t1.6435-9/91164959_1536393269858369_5084893291623743488_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=174925&_nc_ohc=SC8gaHT9JmQAX8Y-jd2&_nc_ht=scontent.fcai20-3.fna&oh=00_AT9dgqsmpRl-zxbHA_9aVpgWwxSbpAytrOJQlyfPuR4iew&oe=637B4728':json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];
    if (json['better_call_saul_appearance'] != null) {
      betterCallSaulAppearance=json['better_call_saul_appearance'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['birthday'] = birthday;
    data['occupation'] = jobs;
    data['img'] = img;
    data['status'] = status;
    data['nickname'] = nickname;
    data['appearance'] = appearance;
    data['portrayed'] = portrayed;
    data['category'] = category;
    return data;
  }

  @override
  List<Object?> get props => [charId,name,birthday,jobs,img,status,nickname,appearance,portrayed,category];
}
