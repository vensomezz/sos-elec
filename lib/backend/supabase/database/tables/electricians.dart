import '../database.dart';

class ElectriciansTable extends SupabaseTable<ElectriciansRow> {
  @override
  String get tableName => 'electricians';

  @override
  ElectriciansRow createRow(Map<String, dynamic> data) => ElectriciansRow(data);
}

class ElectriciansRow extends SupabaseDataRow {
  ElectriciansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ElectriciansTable();

  dynamic? get specializations => getField<dynamic>('specializations');
  set specializations(dynamic? value) =>
      setField<dynamic>('specializations', value);

  String? get profilePhoto => getField<String>('profile_photo');
  set profilePhoto(String? value) => setField<String>('profile_photo', value);

  dynamic? get recentReviews => getField<dynamic>('recent_reviews');
  set recentReviews(dynamic? value) =>
      setField<dynamic>('recent_reviews', value);

  String? get joinedDate => getField<String>('joined_date');
  set joinedDate(String? value) => setField<String>('joined_date', value);

  String? get licenseExpiryDate => getField<String>('license_expiry_date');
  set licenseExpiryDate(String? value) =>
      setField<String>('license_expiry_date', value);

  String? get averageRating => getField<String>('average_rating');
  set averageRating(String? value) => setField<String>('average_rating', value);

  String? get licenseStatus => getField<String>('license_status');
  set licenseStatus(String? value) => setField<String>('license_status', value);

  String? get jobsThisMonth => getField<String>('jobs_this_month');
  set jobsThisMonth(String? value) =>
      setField<String>('jobs_this_month', value);

  String? get responseTimesByRegion =>
      getField<String>('response_times_by_region');
  set responseTimesByRegion(String? value) =>
      setField<String>('response_times_by_region', value);

  String? get licenseNumber => getField<String>('license_number');
  set licenseNumber(String? value) => setField<String>('license_number', value);

  dynamic? get performanceHistory => getField<dynamic>('performance_history');
  set performanceHistory(dynamic? value) =>
      setField<dynamic>('performance_history', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get averageResponseTime => getField<String>('average_response_time');
  set averageResponseTime(String? value) =>
      setField<String>('average_response_time', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get licenseVerifiedDate => getField<String>('license_verified_date');
  set licenseVerifiedDate(String? value) =>
      setField<String>('license_verified_date', value);

  String? get workPreferences => getField<String>('work_preferences');
  set workPreferences(String? value) =>
      setField<String>('work_preferences', value);

  String? get totalJobsCompleted => getField<String>('total_jobs_completed');
  set totalJobsCompleted(String? value) =>
      setField<String>('total_jobs_completed', value);

  dynamic? get serviceAreas => getField<dynamic>('service_areas');
  set serviceAreas(dynamic? value) => setField<dynamic>('service_areas', value);

  String? get currentJobId => getField<String>('current_job_id');
  set currentJobId(String? value) => setField<String>('current_job_id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get currentLocation => getField<String>('current_location');
  set currentLocation(String? value) =>
      setField<String>('current_location', value);

  String? get emergencyContact => getField<String>('emergency_contact');
  set emergencyContact(String? value) =>
      setField<String>('emergency_contact', value);

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

  String? get electricianId => getField<String>('electrician_id');
  set electricianId(String? value) => setField<String>('electrician_id', value);

  String? get stripeAccountId => getField<String>('stripe_account_id');
  set stripeAccountId(String? value) =>
      setField<String>('stripe_account_id', value);

  bool? get chargesEnabled => getField<bool>('charges_enabled');
  set chargesEnabled(bool? value) => setField<bool>('charges_enabled', value);

  bool? get payoutsEnabled => getField<bool>('payouts_enabled');
  set payoutsEnabled(bool? value) => setField<bool>('payouts_enabled', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  bool? get stripeOnboardingCompleted =>
      getField<bool>('stripe_onboarding_completed');
  set stripeOnboardingCompleted(bool? value) =>
      setField<bool>('stripe_onboarding_completed', value);

  double? get currentLatitude => getField<double>('current_latitude');
  set currentLatitude(double? value) =>
      setField<double>('current_latitude', value);

  double? get currentLongitude => getField<double>('current_longitude');
  set currentLongitude(double? value) =>
      setField<double>('current_longitude', value);
}
