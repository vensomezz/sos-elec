import '../database.dart';

class SubscriptionOffersTable extends SupabaseTable<SubscriptionOffersRow> {
  @override
  String get tableName => 'subscription_offers';

  @override
  SubscriptionOffersRow createRow(Map<String, dynamic> data) =>
      SubscriptionOffersRow(data);
}

class SubscriptionOffersRow extends SupabaseDataRow {
  SubscriptionOffersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubscriptionOffersTable();

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get zone => getField<String>('zone')!;
  set zone(String value) => setField<String>('zone', value);

  int get monthlyPrice => getField<int>('monthly_price')!;
  set monthlyPrice(int value) => setField<int>('monthly_price', value);

  int get includedInterventions => getField<int>('included_interventions')!;
  set includedInterventions(int value) =>
      setField<int>('included_interventions', value);

  String get priorityLevel => getField<String>('priority_level')!;
  set priorityLevel(String value) => setField<String>('priority_level', value);

  int get slaTargetMinutes => getField<int>('sla_target_minutes')!;
  set slaTargetMinutes(int value) => setField<int>('sla_target_minutes', value);

  double? get maxLaborHoursPerIntervention =>
      getField<double>('max_labor_hours_per_intervention');
  set maxLaborHoursPerIntervention(double? value) =>
      setField<double>('max_labor_hours_per_intervention', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String get targetCustomers => getField<String>('target_customers')!;
  set targetCustomers(String value) =>
      setField<String>('target_customers', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdDate => getField<DateTime>('created_date');
  set createdDate(DateTime? value) => setField<DateTime>('created_date', value);

  DateTime get updatedDate => getField<DateTime>('updated_date')!;
  set updatedDate(DateTime value) => setField<DateTime>('updated_date', value);

  String get createdById => getField<String>('created_by_id')!;
  set createdById(String value) => setField<String>('created_by_id', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  bool get isSample => getField<bool>('is_sample')!;
  set isSample(bool value) => setField<bool>('is_sample', value);

  String? get offerType => getField<String>('offer_type');
  set offerType(String? value) => setField<String>('offer_type', value);

  int? get minProperties => getField<int>('min_properties');
  set minProperties(int? value) => setField<int>('min_properties', value);

  int? get maxProperties => getField<int>('max_properties');
  set maxProperties(int? value) => setField<int>('max_properties', value);

  double? get maxTotalHoursPerMonth =>
      getField<double>('max_total_hours_per_month');
  set maxTotalHoursPerMonth(double? value) =>
      setField<double>('max_total_hours_per_month', value);

  int? get annualPrice => getField<int>('annual_price');
  set annualPrice(int? value) => setField<int>('annual_price', value);
}
