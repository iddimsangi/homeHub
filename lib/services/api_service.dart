import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/property.dart';

/// API Service for Home Hub Tanzania
/// Handles all backend communication
class ApiService {
  // TODO: Replace with actual API base URL
  static const String baseUrl = 'https://api.homehub.co.tz/v1';

  // API Endpoints
  static const String _authEndpoint = '$baseUrl/auth';
  static const String _propertiesEndpoint = '$baseUrl/properties';
  static const String _usersEndpoint = '$baseUrl/users';
  static const String _otpEndpoint = '$baseUrl/otp';
  static const String _favoritesEndpoint = '$baseUrl/favorites';
  static const String _notificationsEndpoint = '$baseUrl/notifications';

  // Authentication token (stored after login)
  static String? _authToken;

  /// Set authentication token
  static void setAuthToken(String token) {
    _authToken = token;
  }

  /// Get headers with authentication
  static Map<String, String> get _headers {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }

    return headers;
  }

  // ============ AUTHENTICATION ============

  /// Register user with phone number (Tanzania format: +255...)
  Future<Map<String, dynamic>> registerWithPhone({
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_authEndpoint/register/phone'),
        headers: _headers,
        body: json.encode({
          'fullName': fullName,
          'phoneNumber': phoneNumber,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        return {
          'success': true,
          'userId': data['userId'],
          'message': data['message'] ?? 'Registration successful',
        };
      } else {
        return {
          'success': false,
          'message': _getErrorMessage(response),
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: $e',
      };
    }
  }

  /// Send OTP to phone number (via SMS - using Africa's Talking or Twilio)
  Future<Map<String, dynamic>> sendOTP(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$_otpEndpoint/send'),
        headers: _headers,
        body: json.encode({'phoneNumber': phoneNumber}),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'OTP sent to $phoneNumber',
        };
      } else {
        return {
          'success': false,
          'message': _getErrorMessage(response),
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: $e',
      };
    }
  }

  /// Verify OTP code
  Future<Map<String, dynamic>> verifyOTP({
    required String phoneNumber,
    required String otpCode,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_otpEndpoint/verify'),
        headers: _headers,
        body: json.encode({
          'phoneNumber': phoneNumber,
          'otpCode': otpCode,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _authToken = data['token'];
        return {
          'success': true,
          'token': data['token'],
          'user': data['user'],
        };
      } else {
        return {
          'success': false,
          'message': _getErrorMessage(response),
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: $e',
      };
    }
  }

  /// Login with phone number
  Future<Map<String, dynamic>> loginWithPhone(String phoneNumber) async {
    // First send OTP
    final otpResult = await sendOTP(phoneNumber);
    return otpResult;
  }

  /// Login with Google (OAuth)
  Future<Map<String, dynamic>> loginWithGoogle(String idToken) async {
    try {
      final response = await http.post(
        Uri.parse('$_authEndpoint/google'),
        headers: _headers,
        body: json.encode({'idToken': idToken}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _authToken = data['token'];
        return {
          'success': true,
          'token': data['token'],
          'user': data['user'],
        };
      } else {
        return {
          'success': false,
          'message': _getErrorMessage(response),
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: $e',
      };
    }
  }

  /// Login with Facebook (OAuth)
  Future<Map<String, dynamic>> loginWithFacebook(String accessToken) async {
    try {
      final response = await http.post(
        Uri.parse('$_authEndpoint/facebook'),
        headers: _headers,
        body: json.encode({'accessToken': accessToken}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _authToken = data['token'];
        return {
          'success': true,
          'token': data['token'],
          'user': data['user'],
        };
      } else {
        return {
          'success': false,
          'message': _getErrorMessage(response),
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: $e',
      };
    }
  }

  /// Logout
  Future<void> logout() async {
    _authToken = null;
  }

  // ============ PROPERTIES ============

  /// Get all properties with optional filters
  Future<List<Property>> getProperties({
    String? area,
    double? minPrice,
    double? maxPrice,
    PropertyType? propertyType,
    RentalPeriod? rentalPeriod,
    List<String>? locationTags,
    int? page,
    int? limit,
  }) async {
    try {
      final queryParams = <String, String>{};

      if (area != null) queryParams['area'] = area;
      if (minPrice != null) queryParams['minPrice'] = minPrice.toString();
      if (maxPrice != null) queryParams['maxPrice'] = maxPrice.toString();
      if (propertyType != null) {
        queryParams['propertyType'] = propertyType.toString().split('.').last;
      }
      if (rentalPeriod != null) {
        queryParams['rentalPeriod'] = rentalPeriod.toString().split('.').last;
      }
      if (locationTags != null && locationTags.isNotEmpty) {
        queryParams['tags'] = locationTags.join(',');
      }
      if (page != null) queryParams['page'] = page.toString();
      if (limit != null) queryParams['limit'] = limit.toString();

      final uri = Uri.parse(_propertiesEndpoint).replace(
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );

      final response = await http.get(uri, headers: _headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> propertiesList = data['properties'] ?? [];
        return propertiesList.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception(_getErrorMessage(response));
      }
    } catch (e) {
      throw Exception('Failed to load properties: $e');
    }
  }

  /// Get property by ID
  Future<Property> getPropertyById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$_propertiesEndpoint/$id'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Property.fromJson(data);
      } else {
        throw Exception(_getErrorMessage(response));
      }
    } catch (e) {
      throw Exception('Failed to load property: $e');
    }
  }

  /// Search properties by text query
  Future<List<Property>> searchProperties(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$_propertiesEndpoint/search?q=$query'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> propertiesList = data['properties'] ?? [];
        return propertiesList.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception(_getErrorMessage(response));
      }
    } catch (e) {
      throw Exception('Failed to search properties: $e');
    }
  }

  /// Get featured properties
  Future<List<Property>> getFeaturedProperties() async {
    try {
      final response = await http.get(
        Uri.parse('$_propertiesEndpoint/featured'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> propertiesList = data['properties'] ?? [];
        return propertiesList.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception(_getErrorMessage(response));
      }
    } catch (e) {
      throw Exception('Failed to load featured properties: $e');
    }
  }

  /// Get properties near a location (latitude, longitude, radius in km)
  Future<List<Property>> getPropertiesNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 5.0,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_propertiesEndpoint/nearby?lat=$latitude&lng=$longitude&radius=$radiusKm',
        ),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> propertiesList = data['properties'] ?? [];
        return propertiesList.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception(_getErrorMessage(response));
      }
    } catch (e) {
      throw Exception('Failed to load nearby properties: $e');
    }
  }

  // ============ FAVORITES ============

  /// Add property to favorites
  Future<bool> addToFavorites(String propertyId) async {
    try {
      final response = await http.post(
        Uri.parse('$_favoritesEndpoint/add'),
        headers: _headers,
        body: json.encode({'propertyId': propertyId}),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  /// Remove property from favorites
  Future<bool> removeFromFavorites(String propertyId) async {
    try {
      final response = await http.delete(
        Uri.parse('$_favoritesEndpoint/$propertyId'),
        headers: _headers,
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Get user's favorite properties
  Future<List<Property>> getFavorites() async {
    try {
      final response = await http.get(
        Uri.parse(_favoritesEndpoint),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> propertiesList = data['favorites'] ?? [];
        return propertiesList.map((json) => Property.fromJson(json)).toList();
      } else {
        throw Exception(_getErrorMessage(response));
      }
    } catch (e) {
      throw Exception('Failed to load favorites: $e');
    }
  }

  // ============ NOTIFICATIONS ============

  /// Register device for push notifications
  Future<bool> registerDeviceToken(String fcmToken) async {
    try {
      final response = await http.post(
        Uri.parse('$_notificationsEndpoint/register'),
        headers: _headers,
        body: json.encode({'fcmToken': fcmToken}),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Subscribe to area notifications
  Future<bool> subscribeToArea(String area) async {
    try {
      final response = await http.post(
        Uri.parse('$_notificationsEndpoint/subscribe/area'),
        headers: _headers,
        body: json.encode({'area': area}),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // ============ LANDLORD CONTACT ============

  /// Send message to landlord
  Future<bool> sendMessageToLandlord({
    required String propertyId,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/messages/send'),
        headers: _headers,
        body: json.encode({
          'propertyId': propertyId,
          'message': message,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Request property viewing
  Future<bool> requestViewing({
    required String propertyId,
    required DateTime preferredDate,
    String? message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/viewings/request'),
        headers: _headers,
        body: json.encode({
          'propertyId': propertyId,
          'preferredDate': preferredDate.toIso8601String(),
          'message': message,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // ============ HELPER METHODS ============

  /// Extract error message from response
  String _getErrorMessage(http.Response response) {
    try {
      final data = json.decode(response.body);
      return data['message'] ?? data['error'] ?? 'Unknown error occurred';
    } catch (e) {
      return 'Error: ${response.statusCode}';
    }
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _authToken != null;

  /// Get current auth token
  String? get authToken => _authToken;
}
