import 'package:crud/data/dio_logging.dart';
import 'package:crud/data/model/person.dart';
import 'package:dio/dio.dart';

const _baseURL = 'https://61b6fd1ec95dd70017d41143.mockapi.io';

class ApiClientResponse {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseURL,
      connectTimeout: 30000,
      sendTimeout: 30000,
    ),
  )..interceptors.add(Logging());

  Future<List<Person>> fetchData() async {
    try {
      Response response = await _dio.get('/Person');

      if (response.statusCode == 200) {
        return List<Person>.from(response.data.map((e) => Person.fromJson(e)));
      } else {
        throw Exception('Error to load data');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw ('Error(fetchData): ${e.response!.statusCode} - ${e.response!.data}');
      } else {
        throw ('Something went wrong: ${e.message}');
      }
    }
  }

  Future<Person> addProfile({
    String? firstName,
    String? lastName,
    String? message,
  }) async {
    Person? data;
    try {
      Response response = await _dio.post(
        '/Person',
        data: {
          'firstname': firstName,
          'lastname': lastName,
          'message': message,
        },
      );
      Person person = Person.fromJson(response.data);
      if (response.statusCode == 201) {
        data = person;
      }
    } on DioError catch (e) {
      e.toString();
    }
    return data!;
  }

  // editData
  Future<Person> editData(
      {String? id,
      String? firstname,
      String? lastname,
      String? message}) async {
    Person? data;
    try {
      Response response = await _dio.put('/Person/$id', data: {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'message': message,
      });
      Person person = Person.fromJson(response.data);
      return data = person;
    } on DioError catch (e) {
      e.toString();
    }
    return data!;
  }

  Future<Person> deleteData({String? id}) async {
    Person? data;
    try {
      Response response = await _dio.delete('/Person/$id');
      Person person = Person.fromJson(response.data);
      return data = person;
    } on DioError catch (e) {
      e.toString();
    }
    return data!;
  }
}
