import '../database.dart';

class MissionsTable extends SupabaseTable<MissionsRow> {
  @override
  String get tableName => 'Missions';

  @override
  MissionsRow createRow(Map<String, dynamic> data) => MissionsRow(data);
}

class MissionsRow extends SupabaseDataRow {
  MissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MissionsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get electricianId => getField<String>('electrician_id');
  set electricianId(String? value) => setField<String>('electrician_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
