import 'package:isar/isar.dart';

part 'db_brooon_pagination_count_schema.g.dart';

@collection
class DbBrooonPaginationCountSchema {
  late Id id;
  int? totalItemsCount;
  int? totalPages;
  int? currentPage;
  int? nextPage;
}
