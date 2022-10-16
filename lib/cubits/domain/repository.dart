part of 'cubit.dart';

class DomainRepository {
  Stream<DocumentSnapshot<Map<String, dynamic>>> fetch() =>
      DomainDataProvider.fetch();
}
