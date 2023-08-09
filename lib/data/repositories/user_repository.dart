import '../sources/api_provider.dart';
import '../sources/local_storage.dart';

class UserRepository {
  final ApiProvider apiProvider;
  final LocalStorage localStorage;

  UserRepository(this.apiProvider, this.localStorage);

  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      final users = await apiProvider.getUsersFromApi();
      localStorage.saveUsersLocally(users);
      return users;
    } catch (e) {
      return localStorage.getLocalUsers();
    }
  }

  Future<Map<String, dynamic>> getUserDetails(int userId) async {
    return apiProvider.getUserDetailsFromApi(userId);
  }
}
