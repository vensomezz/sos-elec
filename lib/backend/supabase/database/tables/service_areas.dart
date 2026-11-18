import '../database.dart';

class ServiceAreasTable extends SupabaseTable<ServiceAreasRow> {
  @override
  String get tableName => 'service_areas';

  @override
  ServiceAreasRow createRow(Map<String, dynamic> data) => ServiceAreasRow(data);
}

class ServiceAreasRow extends SupabaseDataRow {
  ServiceAreasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceAreasTable();

  String? get areaName => getField<String>('area_name');
  set areaName(String? value) => setField<String>('area_name', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get region => getField<String>('region');
  set region(String? value) => setField<String>('region', value);

  dynamic? get zipCodes => getField<dynamic>('zip_codes');
  set zipCodes(dynamic? value) => setField<dynamic>('zip_codes', value);

  int? get coverageRadiusKm => getField<int>('coverage_radius_km');
  set coverageRadiusKm(int? value) =>
      setField<int>('coverage_radius_km', value);

  dynamic? get centerCoordinates => getField<dynamic>('center_coordinates');
  set centerCoordinates(dynamic? value) =>
      setField<dynamic>('center_coordinates', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  bool? get surgePricingActive => getField<bool>('surge_pricing_active');
  set surgePricingActive(bool? value) =>
      setField<bool>('surge_pricing_active', value);

  double? get surgeMultiplier => getField<double>('surge_multiplier');
  set surgeMultiplier(double? value) =>
      setField<double>('surge_multiplier', value);

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
