import 'package:better_one/repositories/setting_repo/settings_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_viewmode_state.dart';
part 'setting_viewmode.freezed.dart';

class SettingViewModel extends Cubit<SettingViewModelState> {
  SettingViewModel(this.settingsRepo) : super(const SettingViewModelState());
  final SettingsRepoInterface settingsRepo;
}
