abstract class AbstractDBRepository {
  Future<int> insert(Map<String, dynamic> row);
  Future<int> update(Map<String, dynamic> row);
  Future<int> delete(int id);
  Future<List<Object>> findAll();
  Future<Object?> findOne(int id);
}
