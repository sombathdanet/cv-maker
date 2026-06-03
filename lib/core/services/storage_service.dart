import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final _box = GetStorage();

  static const String _resumeDataKey = 'resume_builder_state';
  static const String _designStateKey = 'resume_design_state';

  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  void saveResumeData(Map<String, dynamic> data) {
    _box.write(_resumeDataKey, jsonEncode(data));
  }

  Map<String, dynamic>? getResumeData() {
    final raw = _box.read<String>(_resumeDataKey);
    if (raw == null) return null;
    try {
      return jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  void saveDesignState(Map<String, dynamic> data) {
    _box.write(_designStateKey, jsonEncode(data));
  }

  Map<String, dynamic>? getDesignState() {
    final raw = _box.read<String>(_designStateKey);
    if (raw == null) return null;
    try {
      return jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  void clearAll() {
    _box.remove(_resumeDataKey);
    _box.remove(_designStateKey);
  }
}
