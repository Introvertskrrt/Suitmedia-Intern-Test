import 'package:get/get.dart';
import 'package:suitmedia_test/models/users_model.dart';
import 'package:suitmedia_test/repositories/users_repository.dart';

class ThirdPageController extends GetxController {
  final UserRepository userRepository = UserRepository();
  var users = <Users>[].obs;
  var hasMore = true.obs;

  final int limit = 9;
  int pageIndex = 1;

  Future getUser() async{
    List<Users> response = await userRepository.fetchUsers(pageIndex, limit);
    if (response.length < limit) {
      hasMore.value = false;
    }

    users.addAll(response);
    pageIndex++;
  }

  Future<void> onRefresh() async {
    pageIndex = 1;
    hasMore.value = true;
    users.value = [];

    await getUser();
  }
}