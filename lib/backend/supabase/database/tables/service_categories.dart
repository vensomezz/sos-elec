import '../database.dart';

class ServiceCategoriesTable extends SupabaseTable<ServiceCategoriesRow> {
  @override
  String get tableName => 'service_categories';

  @override
  ServiceCategoriesRow createRow(Map<String, dynamic> data) =>
      ServiceCategoriesRow(data);
}

class ServiceCategoriesRow extends SupabaseDataRow {
  ServiceCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceCategoriesTable();

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  int? get basePrice => getField<int>('base_price');
  set basePrice(int? value) => setField<int>('base_price', value);

  int? get estimatedDuration => getField<int>('estimated_duration');
  set estimatedDuration(int? value) =>
      setField<int>('estimated_duration', value);

  bool? get isEmergency => getField<bool>('is_emergency');
  set isEmergency(bool? value) => setField<bool>('is_emergency', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdDate => getField<DateTime>('created_date');
  set createdDate(DateTime? value) => setField<DateTime>('created_date', value);

  DateTime? get updatedDate => getField<DateTime>('updated_date');
  set updatedDate(DateTime? value) => setField<DateTime>('updated_date', value);

  String? get createdById => getField<String>('created_by_id');
  set createdById(String? value) => setField<String>('created_by_id', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  bool? get isSample => getField<bool>('is_sample');
  set isSample(bool? value) => setField<bool>('is_sample', value);
}
