part of 'cubit.dart';

class DietDataProvider {
  static final dio = Dio();

  static Future<Diet> fetch(Map<String, dynamic> map) async {
    try {
      // const url = 'http://192.168.1.131:8000/dietrecommender/';
      const url = 'http://127.0.0.1:8000/dietrecommender/';

      final resp = await dio.post(
        url,
        data: map,
      );

      final data = resp.data;
      final diet = Diet.fromMap(data);

      return diet;
    } catch (e) {
      throw e.toString();
    }
  }
}
