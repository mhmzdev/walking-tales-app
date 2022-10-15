part of 'cubit.dart';

class AuthRepository {
  Future<AuthData> fetch() => AuthDataProvider.fetch();

  Future<void> forgotPassword(String email) =>
      AuthDataProvider.forgotPassword(email);

  Future<AuthData> login(String email, String password) {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };
    return AuthDataProvider.login(map);
  }

  Future<void> register(
    String fullName,
    String email,
    String password,
    String gender,
    DateTime dob,
    double weight,
    double height,
  ) {
    final age = dob.difference(DateTime.now()).inDays;

    Map<String, dynamic> map = {
      'fullName': fullName,
      'email': email,
      'password': password,
      'imageUrl': '',
      'gender': gender,
      'weight': weight,
      'height': height,
      'age': age,
    };

    return AuthDataProvider.register(map);
  }
}
