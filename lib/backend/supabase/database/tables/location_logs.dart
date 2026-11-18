import '../database.dart';

class LocationLogsTable extends SupabaseTable<LocationLogsRow> {
  @override
  String get tableName => 'location_logs';

  @override
  LocationLogsRow createRow(Map<String, dynamic> data) => LocationLogsRow(data);
}

class LocationLogsRow extends SupabaseDataRow {
  LocationLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationLogsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get electricianId => getField<String>('electrician_id');
  set electricianId(String? value) => setField<String>('electrician_id', value);

  String? get serviceRequestId => getField<String>('service_request_id');
  set serviceRequestId(String? value) =>
      setField<String>('service_request_id', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);
}
