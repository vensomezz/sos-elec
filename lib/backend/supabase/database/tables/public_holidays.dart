import '../database.dart';

class PublicHolidaysTable extends SupabaseTable<PublicHolidaysRow> {
  @override
  String get tableName => 'public_holidays';

  @override
  PublicHolidaysRow createRow(Map<String, dynamic> data) =>
      PublicHolidaysRow(data);
}

class PublicHolidaysRow extends SupabaseDataRow {
  PublicHolidaysRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PublicHolidaysTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime get holidayDate => getField<DateTime>('holiday_date')!;
  set holidayDate(DateTime value) => setField<DateTime>('holiday_date', value);

  String? get holidayName => getField<String>('holiday_name');
  set holidayName(String? value) => setField<String>('holiday_name', value);
}
