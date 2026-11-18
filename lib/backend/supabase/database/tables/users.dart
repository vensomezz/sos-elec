import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool? get isOnline => getField<bool>('is_online');
  set isOnline(bool? value) => setField<bool>('is_online', value);

  DateTime? get lastSeen => getField<DateTime>('last_seen');
  set lastSeen(DateTime? value) => setField<DateTime>('last_seen', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get onesignalPlayerId => getField<String>('onesignal_player_id');
  set onesignalPlayerId(String? value) =>
      setField<String>('onesignal_player_id', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  DateTime? get fcmUpdatedAt => getField<DateTime>('fcm_updated_at');
  set fcmUpdatedAt(DateTime? value) =>
      setField<DateTime>('fcm_updated_at', value);

  String? get accountType => getField<String>('account_type');
  set accountType(String? value) => setField<String>('account_type', value);

  bool? get isAvailable => getField<bool>('is_available');
  set isAvailable(bool? value) => setField<bool>('is_available', value);

  String? get serviceArea => getField<String>('service_area');
  set serviceArea(String? value) => setField<String>('service_area', value);

  String? get profileImageUrl => getField<String>('profile_image_url');
  set profileImageUrl(String? value) =>
      setField<String>('profile_image_url', value);

  String? get electricianType => getField<String>('electrician_type');
  set electricianType(String? value) =>
      setField<String>('electrician_type', value);

  double? get commissionRate => getField<double>('commission_rate');
  set commissionRate(double? value) =>
      setField<double>('commission_rate', value);

  String? get materialsSupplier => getField<String>('materials_supplier');
  set materialsSupplier(String? value) =>
      setField<String>('materials_supplier', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get postcode => getField<String>('postcode');
  set postcode(String? value) => setField<String>('postcode', value);

  String? get addressLine => getField<String>('address_line');
  set addressLine(String? value) => setField<String>('address_line', value);

  bool? get isFirstTime => getField<bool>('is_first_time');
  set isFirstTime(bool? value) => setField<bool>('is_first_time', value);
}
