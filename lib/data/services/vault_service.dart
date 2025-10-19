import 'package:hive_flutter/hive_flutter.dart';
import '../models/vault_models.dart';

/// Service for managing vault entries with Hive storage
class VaultService {
  static const String _boxName = 'vaultBox';
  static Box<VaultEntry>? _box;

  /// Initialize the vault box
  static Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(VaultEntryAdapter());
    }
    _box = await Hive.openBox<VaultEntry>(_boxName);
  }

  /// Get all vault entries
  static List<VaultEntry> getEntries() {
    if (_box == null) {
      throw StateError('VaultService not initialized. Call init() first.');
    }
    return _box!.values.toList();
  }

  /// Add a new entry to the vault
  static Future<void> addEntry(VaultEntry entry) async {
    if (_box == null) {
      throw StateError('VaultService not initialized. Call init() first.');
    }
    await _box!.put(entry.id, entry);
  }

  /// Delete an entry from the vault
  static Future<void> deleteEntry(String id) async {
    if (_box == null) {
      throw StateError('VaultService not initialized. Call init() first.');
    }
    await _box!.delete(id);
  }

  /// Clear all vault entries
  static Future<void> clearAll() async {
    if (_box == null) {
      throw StateError('VaultService not initialized. Call init() first.');
    }
    await _box!.clear();
  }

  /// Close the vault box
  static Future<void> close() async {
    await _box?.close();
    _box = null;
  }
}

