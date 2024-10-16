import 'package:dio/dio.dart';

Future<String> setAudioPlay(String text) async {

  final dio = Dio();
  var response = await dio.get('https://tilashar.choices.kz/api/?audio_text=' + text);

  String cleanBase64Data = response.toString().substring(22);

  return cleanBase64Data;
}
