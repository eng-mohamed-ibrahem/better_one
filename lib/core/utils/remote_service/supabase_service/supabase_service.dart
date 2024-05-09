import 'package:better_one/core/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  late SupabaseClient userAccount;
  Future<void> init() async {
    await Supabase.initialize(
      url: SupabaseStrings.url,
      anonKey: SupabaseStrings.apiKey,
    );
    userAccount = Supabase.instance.client;
  }
}
