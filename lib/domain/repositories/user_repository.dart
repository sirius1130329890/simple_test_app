abstract class UserRepository {
  Future<List<Map<String, dynamic>>> getUsers();
  Future<Map<String, dynamic>> getUserDetails(int userId);
}
