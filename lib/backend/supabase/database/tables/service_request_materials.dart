import '../database.dart';

class ServiceRequestMaterialsTable
    extends SupabaseTable<ServiceRequestMaterialsRow> {
  @override
  String get tableName => 'service_request_materials';

  @override
  ServiceRequestMaterialsRow createRow(Map<String, dynamic> data) =>
      ServiceRequestMaterialsRow(data);
}

class ServiceRequestMaterialsRow extends SupabaseDataRow {
  ServiceRequestMaterialsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceRequestMaterialsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get serviceRequestId => getField<String>('service_request_id');
  set serviceRequestId(String? value) =>
      setField<String>('service_request_id', value);

  String get materialName => getField<String>('material_name')!;
  set materialName(String value) => setField<String>('material_name', value);

  double get quantity => getField<double>('quantity')!;
  set quantity(double value) => setField<double>('quantity', value);

  double get unitPrice => getField<double>('unit_price')!;
  set unitPrice(double value) => setField<double>('unit_price', value);

  double get totalPrice => getField<double>('total_price')!;
  set totalPrice(double value) => setField<double>('total_price', value);
}
