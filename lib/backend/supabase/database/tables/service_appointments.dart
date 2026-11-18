import '../database.dart';

class ServiceAppointmentsTable extends SupabaseTable<ServiceAppointmentsRow> {
  @override
  String get tableName => 'service_appointments';

  @override
  ServiceAppointmentsRow createRow(Map<String, dynamic> data) =>
      ServiceAppointmentsRow(data);
}

class ServiceAppointmentsRow extends SupabaseDataRow {
  ServiceAppointmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceAppointmentsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime get appointmentDate => getField<DateTime>('appointment_date')!;
  set appointmentDate(DateTime value) =>
      setField<DateTime>('appointment_date', value);

  PostgresTime get startTime => getField<PostgresTime>('start_time')!;
  set startTime(PostgresTime value) =>
      setField<PostgresTime>('start_time', value);

  PostgresTime get endTime => getField<PostgresTime>('end_time')!;
  set endTime(PostgresTime value) => setField<PostgresTime>('end_time', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
