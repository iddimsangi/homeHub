/// Property model for Home Hub Tanzania
/// Represents a rental property listing with all relevant details
class Property {
  final String id;
  final String title;
  final String description;

  // Pricing in TZS (Tanzanian Shillings)
  final double monthlyPrice;
  final double? threeMonthPrice;
  final double? sixMonthPrice;
  final double? yearlyPrice;

  // Location details
  final String area; // e.g., "Kigamboni", "Mbezi Beach"
  final String region; // e.g., "Dar es Salaam", "Arusha"
  final double latitude;
  final double longitude;
  final List<String>
      locationTags; // e.g., ["near beach", "near city", "near main road"]

  // Property details
  final PropertyType propertyType;
  final int bedrooms;
  final int bathrooms;
  final int? kitchens;
  final double? squareFeet;

  // Media
  final List<String> images;
  final String? videoUrl;

  // Landlord/Contact
  final String landlordId;
  final String landlordName;
  final String landlordPhone;
  final String? landlordWhatsApp;
  final bool isVerified; // Verified landlord badge

  // Additional info
  final String? houseRules;
  final List<String>
      amenities; // e.g., ["WiFi", "Parking", "Security", "Water"]
  final DateTime availableFrom;
  final bool isAvailable;
  final List<RentalPeriod> availablePeriods;

  // Engagement
  final int viewCount;
  final double? rating;
  final int reviewCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.monthlyPrice,
    this.threeMonthPrice,
    this.sixMonthPrice,
    this.yearlyPrice,
    required this.area,
    required this.region,
    required this.latitude,
    required this.longitude,
    this.locationTags = const [],
    required this.propertyType,
    required this.bedrooms,
    required this.bathrooms,
    this.kitchens,
    this.squareFeet,
    this.images = const [],
    this.videoUrl,
    required this.landlordId,
    required this.landlordName,
    required this.landlordPhone,
    this.landlordWhatsApp,
    this.isVerified = false,
    this.houseRules,
    this.amenities = const [],
    required this.availableFrom,
    this.isAvailable = true,
    this.availablePeriods = const [RentalPeriod.monthly],
    this.viewCount = 0,
    this.rating,
    this.reviewCount = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Get formatted price in TZS
  String getFormattedPrice(RentalPeriod period) {
    double price;
    switch (period) {
      case RentalPeriod.monthly:
        price = monthlyPrice;
        break;
      case RentalPeriod.threeMonths:
        price = threeMonthPrice ?? monthlyPrice * 3;
        break;
      case RentalPeriod.sixMonths:
        price = sixMonthPrice ?? monthlyPrice * 6;
        break;
      case RentalPeriod.yearly:
        price = yearlyPrice ?? monthlyPrice * 12;
        break;
    }
    return 'TZS ${_formatNumber(price)}';
  }

  String _formatNumber(double number) {
    return number.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  /// Get property type display name
  String get propertyTypeDisplay {
    switch (propertyType) {
      case PropertyType.singleRoom:
        return 'Single Room';
      case PropertyType.oneBedroom:
        return '1 Bedroom';
      case PropertyType.twoBedroom:
        return '2 Bedrooms';
      case PropertyType.threeBedroom:
        return '3 Bedrooms';
      case PropertyType.familyHouse:
        return 'Family House';
      case PropertyType.apartment:
        return 'Apartment';
      case PropertyType.studio:
        return 'Studio';
    }
  }

  /// Convert to JSON for API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'monthlyPrice': monthlyPrice,
      'threeMonthPrice': threeMonthPrice,
      'sixMonthPrice': sixMonthPrice,
      'yearlyPrice': yearlyPrice,
      'area': area,
      'region': region,
      'latitude': latitude,
      'longitude': longitude,
      'locationTags': locationTags,
      'propertyType': propertyType.toString().split('.').last,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'kitchens': kitchens,
      'squareFeet': squareFeet,
      'images': images,
      'videoUrl': videoUrl,
      'landlordId': landlordId,
      'landlordName': landlordName,
      'landlordPhone': landlordPhone,
      'landlordWhatsApp': landlordWhatsApp,
      'isVerified': isVerified,
      'houseRules': houseRules,
      'amenities': amenities,
      'availableFrom': availableFrom.toIso8601String(),
      'isAvailable': isAvailable,
      'availablePeriods':
          availablePeriods.map((p) => p.toString().split('.').last).toList(),
      'viewCount': viewCount,
      'rating': rating,
      'reviewCount': reviewCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create from JSON
  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      monthlyPrice: json['monthlyPrice'].toDouble(),
      threeMonthPrice: json['threeMonthPrice']?.toDouble(),
      sixMonthPrice: json['sixMonthPrice']?.toDouble(),
      yearlyPrice: json['yearlyPrice']?.toDouble(),
      area: json['area'],
      region: json['region'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      locationTags: List<String>.from(json['locationTags'] ?? []),
      propertyType: PropertyType.values.firstWhere(
        (e) => e.toString().split('.').last == json['propertyType'],
      ),
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      kitchens: json['kitchens'],
      squareFeet: json['squareFeet']?.toDouble(),
      images: List<String>.from(json['images'] ?? []),
      videoUrl: json['videoUrl'],
      landlordId: json['landlordId'],
      landlordName: json['landlordName'],
      landlordPhone: json['landlordPhone'],
      landlordWhatsApp: json['landlordWhatsApp'],
      isVerified: json['isVerified'] ?? false,
      houseRules: json['houseRules'],
      amenities: List<String>.from(json['amenities'] ?? []),
      availableFrom: DateTime.parse(json['availableFrom']),
      isAvailable: json['isAvailable'] ?? true,
      availablePeriods: (json['availablePeriods'] as List?)
              ?.map((p) => RentalPeriod.values.firstWhere(
                    (e) => e.toString().split('.').last == p,
                  ))
              .toList() ??
          [RentalPeriod.monthly],
      viewCount: json['viewCount'] ?? 0,
      rating: json['rating']?.toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  /// Create a copy with updated fields
  Property copyWith({
    String? id,
    String? title,
    String? description,
    double? monthlyPrice,
    double? threeMonthPrice,
    double? sixMonthPrice,
    double? yearlyPrice,
    String? area,
    String? region,
    double? latitude,
    double? longitude,
    List<String>? locationTags,
    PropertyType? propertyType,
    int? bedrooms,
    int? bathrooms,
    int? kitchens,
    double? squareFeet,
    List<String>? images,
    String? videoUrl,
    String? landlordId,
    String? landlordName,
    String? landlordPhone,
    String? landlordWhatsApp,
    bool? isVerified,
    String? houseRules,
    List<String>? amenities,
    DateTime? availableFrom,
    bool? isAvailable,
    List<RentalPeriod>? availablePeriods,
    int? viewCount,
    double? rating,
    int? reviewCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Property(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      monthlyPrice: monthlyPrice ?? this.monthlyPrice,
      threeMonthPrice: threeMonthPrice ?? this.threeMonthPrice,
      sixMonthPrice: sixMonthPrice ?? this.sixMonthPrice,
      yearlyPrice: yearlyPrice ?? this.yearlyPrice,
      area: area ?? this.area,
      region: region ?? this.region,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationTags: locationTags ?? this.locationTags,
      propertyType: propertyType ?? this.propertyType,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      kitchens: kitchens ?? this.kitchens,
      squareFeet: squareFeet ?? this.squareFeet,
      images: images ?? this.images,
      videoUrl: videoUrl ?? this.videoUrl,
      landlordId: landlordId ?? this.landlordId,
      landlordName: landlordName ?? this.landlordName,
      landlordPhone: landlordPhone ?? this.landlordPhone,
      landlordWhatsApp: landlordWhatsApp ?? this.landlordWhatsApp,
      isVerified: isVerified ?? this.isVerified,
      houseRules: houseRules ?? this.houseRules,
      amenities: amenities ?? this.amenities,
      availableFrom: availableFrom ?? this.availableFrom,
      isAvailable: isAvailable ?? this.isAvailable,
      availablePeriods: availablePeriods ?? this.availablePeriods,
      viewCount: viewCount ?? this.viewCount,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Property types available in Tanzania
enum PropertyType {
  singleRoom,
  oneBedroom,
  twoBedroom,
  threeBedroom,
  familyHouse,
  apartment,
  studio,
}

/// Rental period options
enum RentalPeriod {
  monthly,
  threeMonths,
  sixMonths,
  yearly,
}

extension RentalPeriodExtension on RentalPeriod {
  String get displayName {
    switch (this) {
      case RentalPeriod.monthly:
        return 'Monthly';
      case RentalPeriod.threeMonths:
        return '3 Months';
      case RentalPeriod.sixMonths:
        return '6 Months';
      case RentalPeriod.yearly:
        return '1 Year';
    }
  }
}
