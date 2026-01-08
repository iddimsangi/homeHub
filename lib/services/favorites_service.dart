import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/property.dart';

/// Service to manage user's favorite properties
class FavoritesService extends ChangeNotifier {
  static const String _favoritesKey = 'user_favorites';
  final Set<String> _favoriteIds = {};
  final List<Property> _favoriteProperties = [];

  Set<String> get favoriteIds => _favoriteIds;
  List<Property> get favoriteProperties => _favoriteProperties;

  /// Initialize favorites from local storage
  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getString(_favoritesKey);

      if (favoritesJson != null) {
        final List<dynamic> favoritesList = json.decode(favoritesJson);
        _favoriteIds.clear();
        _favoriteProperties.clear();

        for (var item in favoritesList) {
          final property = Property.fromJson(item);
          _favoriteIds.add(property.id);
          _favoriteProperties.add(property);
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  /// Check if a property is favorited
  bool isFavorite(String propertyId) {
    return _favoriteIds.contains(propertyId);
  }

  /// Add property to favorites
  Future<bool> addFavorite(Property property) async {
    if (_favoriteIds.contains(property.id)) {
      return false; // Already favorited
    }

    try {
      _favoriteIds.add(property.id);
      _favoriteProperties.add(property);
      await _saveFavorites();
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error adding favorite: $e');
      return false;
    }
  }

  /// Remove property from favorites
  Future<bool> removeFavorite(String propertyId) async {
    if (!_favoriteIds.contains(propertyId)) {
      return false; // Not favorited
    }

    try {
      _favoriteIds.remove(propertyId);
      _favoriteProperties.removeWhere((p) => p.id == propertyId);
      await _saveFavorites();
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error removing favorite: $e');
      return false;
    }
  }

  /// Toggle favorite status
  Future<bool> toggleFavorite(Property property) async {
    if (isFavorite(property.id)) {
      return await removeFavorite(property.id);
    } else {
      return await addFavorite(property);
    }
  }

  /// Clear all favorites
  Future<void> clearFavorites() async {
    try {
      _favoriteIds.clear();
      _favoriteProperties.clear();
      await _saveFavorites();
      notifyListeners();
    } catch (e) {
      debugPrint('Error clearing favorites: $e');
    }
  }

  /// Get favorite properties count
  int get favoritesCount => _favoriteIds.length;

  /// Get favorite properties by location tag
  List<Property> getFavoritesByTag(String tag) {
    return _favoriteProperties
        .where((p) => p.locationTags.contains(tag))
        .toList();
  }

  /// Get favorite properties by price range
  List<Property> getFavoritesByPriceRange(double min, double max) {
    return _favoriteProperties
        .where((p) => p.monthlyPrice >= min && p.monthlyPrice <= max)
        .toList();
  }

  /// Get favorite properties by area
  List<Property> getFavoritesByArea(String area) {
    return _favoriteProperties
        .where((p) => p.area.toLowerCase() == area.toLowerCase())
        .toList();
  }

  /// Save favorites to local storage
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> favoritesList =
          _favoriteProperties.map((p) => p.toJson()).toList();
      final favoritesJson = json.encode(favoritesList);
      await prefs.setString(_favoritesKey, favoritesJson);
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  /// Export favorites as JSON string (for backup/sharing)
  String exportFavorites() {
    final List<Map<String, dynamic>> favoritesList =
        _favoriteProperties.map((p) => p.toJson()).toList();
    return json.encode(favoritesList);
  }

  /// Import favorites from JSON string
  Future<void> importFavorites(String jsonString) async {
    try {
      final List<dynamic> favoritesList = json.decode(jsonString);
      _favoriteIds.clear();
      _favoriteProperties.clear();

      for (var item in favoritesList) {
        final property = Property.fromJson(item);
        _favoriteIds.add(property.id);
        _favoriteProperties.add(property);
      }

      await _saveFavorites();
      notifyListeners();
    } catch (e) {
      debugPrint('Error importing favorites: $e');
    }
  }
}
