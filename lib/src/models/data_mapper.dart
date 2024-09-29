// ignore_for_file: one_member_abstracts

/// Data Mapper is used to map model to entity.
abstract interface class DataMapper<E> {
  /// Converts the model object to an entity.
  E mapToEntity();
}
