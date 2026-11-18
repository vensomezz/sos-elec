import '../database.dart';

class AddressesTable extends SupabaseTable<AddressesRow> {
  @override
  String get tableName => 'addresses';

  @override
  AddressesRow createRow(Map<String, dynamic> data) => AddressesRow(data);
}

class AddressesRow extends SupabaseDataRow {
  AddressesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AddressesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get addressLine => getField<String>('address_line')!;
  set addressLine(String value) => setField<String>('address_line', value);

  String get city => getField<String>('city')!;
  set city(String value) => setField<String>('city', value);

  String get postcode => getField<String>('postcode')!;
  set postcode(String value) => setField<String>('postcode', value);

  bool? get isDefault => getField<bool>('is_default');
  set isDefault(bool? value) => setField<bool>('is_default', value);
}
