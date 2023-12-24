import 'package:get/get.dart';
import 'package:suitmedia_test/models/users_model.dart';

class UserRepository extends GetConnect {
  final String _baseUrl = "https://reqres.in/api/";

  Future<List<Users>> fetchUsers(int page, int limit) async {
    final response = await get("${_baseUrl}users?page=$page&per_page=$limit");

    // Check if response is successful
    if (response.statusCode == 200) {
      // Extract the 'data' key from the response body
      final jsonDataList = response.body['data'];

      // Return a list of Users objects
      return List<Users>.from(jsonDataList.map((e) => Users.fromJson(e)));
    } else {
      // If the response status code is not 200, handle it accordingly
      throw Exception('Failed to fetch users');
    }
  }
}
