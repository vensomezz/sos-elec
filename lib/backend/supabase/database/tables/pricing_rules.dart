import '../database.dart';

class PricingRulesTable extends SupabaseTable<PricingRulesRow> {
  @override
  String get tableName => 'pricing_rules';

  @override
  PricingRulesRow createRow(Map<String, dynamic> data) => PricingRulesRow(data);
}

class PricingRulesRow extends SupabaseDataRow {
  PricingRulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PricingRulesTable();

  String? get region => getField<String>('region');
  set region(String? value) => setField<String>('region', value);

  String? get zone => getField<String>('zone');
  set zone(String? value) => setField<String>('zone', value);

  int? get diagnosticFee => getField<int>('diagnostic_fee');
  set diagnosticFee(int? value) => setField<int>('diagnostic_fee', value);

  int? get diagnosticIncludedMinutes =>
      getField<int>('diagnostic_included_minutes');
  set diagnosticIncludedMinutes(int? value) =>
      setField<int>('diagnostic_included_minutes', value);

  int? get hourlyRate => getField<int>('hourly_rate');
  set hourlyRate(int? value) => setField<int>('hourly_rate', value);

  int? get quoteThresholdMinutes => getField<int>('quote_threshold_minutes');
  set quoteThresholdMinutes(int? value) =>
      setField<int>('quote_threshold_minutes', value);

  int? get commissionFixed => getField<int>('commission_fixed');
  set commissionFixed(int? value) => setField<int>('commission_fixed', value);

  double? get commissionPercentage => getField<double>('commission_percentage');
  set commissionPercentage(double? value) =>
      setField<double>('commission_percentage', value);

  double? get nightSurchargeMin => getField<double>('night_surcharge_min');
  set nightSurchargeMin(double? value) =>
      setField<double>('night_surcharge_min', value);

  double? get nightSurchargeMax => getField<double>('night_surcharge_max');
  set nightSurchargeMax(double? value) =>
      setField<double>('night_surcharge_max', value);

  double? get weekendSurchargeMin => getField<double>('weekend_surcharge_min');
  set weekendSurchargeMin(double? value) =>
      setField<double>('weekend_surcharge_min', value);

  double? get weekendSurchargeMax => getField<double>('weekend_surcharge_max');
  set weekendSurchargeMax(double? value) =>
      setField<double>('weekend_surcharge_max', value);

  int? get emergencyBonus => getField<int>('emergency_bonus');
  set emergencyBonus(int? value) => setField<int>('emergency_bonus', value);

  int? get slaResponseTimeMinutes => getField<int>('sla_response_time_minutes');
  set slaResponseTimeMinutes(int? value) =>
      setField<int>('sla_response_time_minutes', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get priority => getField<int>('priority');
  set priority(int? value) => setField<int>('priority', value);

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
