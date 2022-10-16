part of 'cubit.dart';

class DietRepository {
  Future<Diet> fetch(int age, double h, double w) {
    final map = {
      'age': age,
      'height': h,
      'weight': w,
    };

    return DietDataProvider.fetch(map);
  }
}
