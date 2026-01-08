# Development Guide - Home Hub Tanzania

## 🚀 Quick Start

### Prerequisites Checklist

- [ ] Flutter SDK 3.6.1+ installed
- [ ] Android Studio or Xcode set up
- [ ] VS Code with Flutter extensions (recommended)
- [ ] Git installed
- [ ] Device or emulator ready

### First Time Setup

1. **Clone and Navigate**

   ```bash
   git clone https://github.com/yourusername/panga.git
   cd panga
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Verify Setup**

   ```bash
   flutter doctor
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

---

## 📁 Project Structure Deep Dive

```
lib/
├── main.dart                    # App entry point
├── models/                      # Data models
│   └── property.dart           # Enhanced property model with TZ features
├── screens/                     # UI screens
│   ├── splash_screen.dart      # App launch screen
│   ├── onboarding_screen.dart  # User onboarding
│   ├── login_screen.dart       # Login UI
│   ├── register_screen.dart    # Registration UI
│   ├── home_screen.dart        # Main property feed
│   ├── question_screen.dart    # Budget/preference questions
│   ├── favorites_screen.dart   # Saved properties (NEW)
│   ├── map_view_screen.dart    # Map placeholder (NEW)
│   └── ...
├── services/                    # Business logic
│   ├── api_service.dart        # Backend API integration (ENHANCED)
│   ├── favorites_service.dart  # Favorites management (NEW)
│   └── localization_service.dart # EN/SW translations (NEW)
└── widgets/                     # Reusable components
    └── property_card.dart      # Property display card
```

---

## 🎨 Design System

### Color Palette

```dart
// Primary Colors
const primaryBlue = Color(0xFF5B5FE9);      // Main brand color
const secondaryCyan = Color(0xFF3DDCFF);    // Accents
const accentOrange = Color(0xFFFFB86C);     // Highlights

// Neutrals
const background = Color(0xFFF8F8FC);       // App background
const cardWhite = Color(0xFFFFFFFF);        // Cards
const textDark = Color(0xFF222222);         // Main text
const textGrey = Color(0xFF9E9E9E);         // Secondary text
```

### Typography

```dart
// Using Google Fonts (already imported)
import 'package:google_fonts/google_fonts.dart';

// Headings
final heading1 = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

// Body text
final bodyText = GoogleFonts.inter(
  fontSize: 14,
  fontWeight: FontWeight.normal,
);
```

### Spacing

```dart
const spacing4 = 4.0;
const spacing8 = 8.0;
const spacing12 = 12.0;
const spacing16 = 16.0;
const spacing24 = 24.0;
const spacing32 = 32.0;
```

---

## 🔧 Key Features Implementation

### 1. Enhanced Property Model

**Location:** `lib/models/property.dart`

Features:

- ✅ TZS pricing (monthly, 3mo, 6mo, yearly)
- ✅ Location tags (near beach, city, road)
- ✅ Landlord contact details
- ✅ Rental period options
- ✅ JSON serialization
- ✅ Price formatting utilities

### 2. Localization Support

**Location:** `lib/services/localization_service.dart`

Features:

- ✅ English (en) and Swahili (sw)
- ✅ 60+ translated strings
- ✅ Easy integration with UI

**Usage Example:**

```dart
import '../services/localization_service.dart';

// In your widget
final loc = AppLocalizations.of(context)!;
Text(loc.hello); // "Hello!" or "Habari!"
```

### 3. Favorites System

**Location:** `lib/services/favorites_service.dart`

Features:

- ✅ Save/remove properties
- ✅ Persistent local storage
- ✅ Filter saved properties
- ✅ Export/import favorites

**Usage Example:**

```dart
final favService = FavoritesService();
await favService.loadFavorites();
await favService.toggleFavorite(property);
```

### 4. Map View Placeholder

**Location:** `lib/screens/map_view_screen.dart`

Current: Placeholder UI
Phase 2: Google Maps integration

**Features to Add:**

- [ ] Google Maps SDK
- [ ] Property markers
- [ ] User location
- [ ] Directions API

### 5. Enhanced API Service

**Location:** `lib/services/api_service.dart`

Endpoints:

- ✅ Phone-based OTP authentication
- ✅ Property search & filters
- ✅ Favorites management
- ✅ Notifications
- ✅ Landlord messaging

---

## 🧪 Testing

### Run Tests

```bash
# All tests
flutter test

# Specific test file
flutter test test/widget_test.dart

# With coverage
flutter test --coverage
```

### Add Tests

Create test files in `test/` directory:

```dart
// test/models/property_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:panga/models/property.dart';

void main() {
  group('Property Model Tests', () {
    test('Price formatting works correctly', () {
      final property = Property(
        // ... required fields
        monthlyPrice: 500000,
      );

      expect(
        property.getFormattedPrice(RentalPeriod.monthly),
        'TZS 500,000',
      );
    });
  });
}
```

---

## 🌍 Localization Setup (Future)

### Add to pubspec.yaml

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.1
```

### Update main.dart

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'services/localization_service.dart';

MaterialApp(
  localizationsDelegates: [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('en', ''), // English
    Locale('sw', ''), // Swahili
  ],
  // ...
)
```

---

## 📱 Building for Production

### Android

1. **Update version**

   ```yaml
   # pubspec.yaml
   version: 1.0.0+1 # versionName+versionCode
   ```

2. **Generate keystore** (first time only)

   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks \
     -keyalg RSA -keysize 2048 -validity 10000 \
     -alias upload
   ```

3. **Configure signing**

   ```properties
   # android/key.properties
   storePassword=your_password
   keyPassword=your_password
   keyAlias=upload
   storeFile=/path/to/upload-keystore.jks
   ```

4. **Build APK**

   ```bash
   flutter build apk --release
   ```

5. **Build App Bundle** (for Play Store)
   ```bash
   flutter build appbundle --release
   ```

### iOS

1. **Open Xcode**

   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Configure signing in Xcode**

   - Select Runner target
   - Set Team
   - Update Bundle Identifier

3. **Build**
   ```bash
   flutter build ios --release
   ```

---

## 🔌 API Integration Checklist

### Phase 1: Mock Data

- [ ] Create mock property data
- [ ] Test UI with mock responses
- [ ] Validate data models

### Phase 2: Backend Integration

- [ ] Replace `baseUrl` in `api_service.dart`
- [ ] Test authentication endpoints
- [ ] Test property endpoints
- [ ] Handle error cases
- [ ] Add loading states
- [ ] Implement retry logic

### API Base URL

```dart
// lib/services/api_service.dart
static const String baseUrl = 'https://api.homehub.co.tz/v1';
```

---

## 🚀 Deployment Checklist

### Pre-launch

- [ ] All features tested
- [ ] Error handling implemented
- [ ] Loading states added
- [ ] Offline functionality
- [ ] Analytics integrated
- [ ] Crash reporting set up

### App Store

- [ ] App screenshots (5-8)
- [ ] App icon (1024x1024)
- [ ] Privacy policy URL
- [ ] Terms of service URL
- [ ] App description (EN + SW)
- [ ] Keywords optimized

### Play Store

- [ ] App screenshots (Phone + Tablet)
- [ ] Feature graphic (1024x500)
- [ ] App icon (512x512)
- [ ] Privacy policy URL
- [ ] Content rating completed
- [ ] Release notes prepared

---

## 🐛 Debugging Tips

### Common Issues

**1. "Package not found"**

```bash
flutter clean
flutter pub get
```

**2. "Build failed"**

```bash
cd android
./gradlew clean
cd ..
flutter build apk
```

**3. "Hot reload not working"**

```bash
flutter run --no-hot
```

### Useful Commands

```bash
# Check for errors
flutter analyze

# Format code
flutter format lib/

# Show device logs
flutter logs

# Clear cache
flutter clean
```

---

## 📚 Resources

### Flutter Documentation

- [Flutter Docs](https://docs.flutter.dev/)
- [Dart Docs](https://dart.dev/guides)
- [Material Design](https://material.io/design)

### Tanzania-Specific

- [Africa's Talking API](https://africastalking.com/) - SMS/OTP
- [M-Pesa API](https://developer.mpesa.vm.co.tz/) - Payments
- [Tanzania Postal Codes](https://www.geonames.org/TZ/postal-codes.html)

### Community

- [Flutter Tanzania Community](https://flutter.dev/community)
- [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter)

---

## 🤝 Contributing Workflow

1. **Fork** the repository
2. **Create** feature branch
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit** changes
   ```bash
   git commit -m "Add amazing feature"
   ```
4. **Push** to branch
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open** Pull Request

---

## 📄 License

This project is licensed under the MIT License - see LICENSE file.

---

**Happy Coding! 🇹🇿**
