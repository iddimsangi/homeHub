# 🏠 HOME HUB - Tanzania's Local Housing Platform

> **Connecting Tanzanians with their dream homes - locally, simply, affordably.**

[![Flutter](https://img.shields.io/badge/Flutter-3.6.1-02569B?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey)]()

---

## 📋 Table of Contents

- [About Home Hub](#about-home-hub)
- [Key Differentiators](#key-differentiators)
- [Features](#features)
- [User Journey](#user-journey)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)

---

## 🎯 About Home Hub

**Home Hub** is Tanzania's first hyper-local house-finding and renting mobile application designed specifically for Tanzanians seeking long-term residential homes. Unlike international platforms like Airbnb, Home Hub focuses exclusively on the local market with features tailored to Tanzanian culture, pricing, and daily life needs.

### The Problem We Solve

Finding a reliable, affordable house in Tanzania is challenging:

- ❌ No centralized platform for local housing
- ❌ Time-consuming physical searches
- ❌ Lack of transparency in pricing
- ❌ Difficulty in verifying locations
- ❌ Limited communication with landlords

### Our Solution

✅ **Simple, fast registration** (phone number only - no email required)  
✅ **Local-first pricing** in Tanzanian Shillings (TZS)  
✅ **Smart search & filters** by location, price, and house type  
✅ **Interactive map view** to visualize house locations  
✅ **Direct landlord contact** via in-app chat, calls, or WhatsApp  
✅ **Bilingual support** - English & Swahili  
✅ **Save favorites** for easy revisiting

---

## 🌟 Key Differentiators

| Feature              | Home Hub                     | Airbnb                       | Traditional Search |
| -------------------- | ---------------------------- | ---------------------------- | ------------------ |
| **Target Audience**  | 🇹🇿 Local Tanzanians          | 🌍 International tourists    | 📰 Newspaper ads   |
| **Rental Duration**  | 📅 Monthly to yearly         | 🌙 Nightly/weekly            | 📅 Varies          |
| **Pricing Currency** | 💰 TZS (Tanzanian Shillings) | 💵 USD                       | 💰 TZS             |
| **Property Type**    | 🏘️ Real residential homes    | 🏨 Short-stay accommodations | 🏘️ Residential     |
| **Registration**     | 📱 Phone + OTP only          | 📧 Email + verification      | ❌ None            |
| **Map Integration**  | ✅ Live location + ride apps | ✅ Basic map                 | ❌ No map          |
| **Language Support** | 🇬🇧 English + 🇹🇿 Swahili      | 🇬🇧 English only              | 🇹🇿 Swahili         |
| **Saved Searches**   | ✅ Yes                       | ✅ Yes                       | ❌ No              |

---

## ✨ Features

### Phase 1 (Current Implementation)

#### 🔐 **Simple Authentication**

- **Phone-based registration**: Enter full name & phone number
- **OTP verification**: SMS-based one-time password
- **No email required**: Fast, local-friendly signup
- **Social login**: Google, Facebook, Apple (optional)

#### 🏠 **Property Discovery**

- **Home Feed**: Browse available houses instantly
- **Property Cards**:
  - Main photo
  - Monthly price (TZS)
  - Location/area
  - House type (1BR, 2BR, etc.)
  - Rental period options

#### 🔍 **Smart Search & Filters**

Search by:

1. **Location**: Area name, popular tags (near beach, city, main road)
2. **Price**: Set max budget in TZS
3. **House Type**: Single room, 1BR, 2BR, family house
4. **Rental Period**: Monthly, 3 months, 6 months, yearly

#### 🗺️ **Map Experience**

- View user's current location
- See available houses as map pins
- Tap pins to preview house details
- Zoom and navigate the map

#### 📍 **Navigation & Directions**

- **Live location tracking**
- **One-click directions**:
  - Open in Google Maps
  - Ride with Bolt
  - Ride with Uber

#### 💬 **Landlord Contact**

- In-app chat messaging
- Direct call functionality
- WhatsApp integration
- Book property visits
- Confirm availability

#### ❤️ **Favorites System**

- Save houses to "My Favorites"
- Easy revisiting and comparison
- Track favorite locations

#### 🔔 **Smart Notifications**

- New houses in saved areas
- Price drop alerts
- Similar property suggestions

#### 🌐 **Bilingual Support**

- English (default)
- Kiswahili (coming soon)
- Seamless language switching

---

## 🚶 User Journey

### **A → Z Experience**

```
Download App → Register → Browse Houses → Search/Filter →
View on Map → Select House → Get Directions → Contact Landlord →
Book Visit → Start Renting
```

### Detailed Flow

#### **Phase 1: Onboarding (30 seconds)**

1. Download from App Store / Play Store
2. View onboarding screens
3. Register with phone number
4. Verify OTP via SMS
5. ✅ **Account created!**

#### **Phase 2: Discovery (Instant)**

- See home feed with available properties
- Browse property cards
- Get instant visual overview

#### **Phase 3: Search (Smart Filters)**

- Use search bar for specific needs
- Apply filters (location, price, type, period)
- Results update in real-time

#### **Phase 4: Map View (Interactive)**

- Switch to map view
- See your location + available houses
- Tap pins for quick previews
- Visual, intuitive, addictive

#### **Phase 5: Property Details**

- View photo gallery
- Check price & rental periods
- Read description & house rules
- See location details

#### **Phase 6: Navigation**

- View house on map
- Get directions via Google Maps
- Book a ride with Bolt/Uber

#### **Phase 7: Contact**

- Chat with landlord
- Call or WhatsApp
- Schedule viewing
- Confirm details

#### **Phase 8: Save & Return**

- Save favorite houses
- Get notifications for saved areas
- Receive price drop alerts

---

## 📱 Screenshots

_Coming soon - Screenshots of main screens will be added here_

```
┌─────────────┬─────────────┬─────────────┬─────────────┐
│   Splash    │  Onboarding │    Login    │  Register   │
├─────────────┼─────────────┼─────────────┼─────────────┤
│  Home Feed  │   Search    │   Map View  │   Details   │
├─────────────┼─────────────┼─────────────┼─────────────┤
│  Favorites  │    Chat     │   Profile   │  Settings   │
└─────────────┴─────────────┴─────────────┴─────────────┘
```

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: 3.6.1 or higher
- **Dart**: 3.6.1 or higher
- **Android Studio** / **Xcode** (for device testing)
- **VS Code** (recommended) with Flutter extensions

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/yourusername/panga.git
   cd panga
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Check Flutter setup**

   ```bash
   flutter doctor
   ```

4. **Run the app**

   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For web (development)
   flutter run -d chrome
   ```

### Configuration

#### API Configuration

Update the API endpoints in `lib/services/api_service.dart`:

```dart
class ApiService {
  static const String baseUrl = 'https://your-api-url.com';

  // Add your API configuration here
}
```

#### Assets

Ensure all required assets are in the `assets/` folder:

- `panga_logo.png` - App logo
- `Illustration.png` - Onboarding illustration 1
- `property.png` - Onboarding illustration 2
- `facebook.png`, `google.png`, `apple.png` - Social login icons

---

## 🛠️ Technology Stack

### Frontend

- **Framework**: Flutter 3.6.1
- **Language**: Dart 3.6.1
- **State Management**: StatefulWidget (considering Provider/Riverpod)
- **UI**: Material Design with custom theming

### Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8 # iOS-style icons
  google_fonts: ^2.1.0 # Custom fonts
  # Coming soon:
  # flutter_map: ^latest           # Map integration
  # geolocator: ^latest            # Location services
  # url_launcher: ^latest          # Open external apps
  # shared_preferences: ^latest    # Local storage
  # provider: ^latest              # State management
```

### Backend (Planned)

- **API**: RESTful API
- **Database**: PostgreSQL / MongoDB
- **Authentication**: JWT + OTP via SMS gateway
- **Storage**: AWS S3 / Cloudinary (for property images)
- **Notifications**: Firebase Cloud Messaging (FCM)

### Services Integration

- **Maps**: Google Maps API
- **SMS**: Africa's Talking / Twilio
- **Payments**: M-Pesa, Tigo Pesa (Phase 2)
- **Ride Hailing**: Bolt API, Uber API

---

## 📂 Project Structure

```
panga/
├── android/                 # Android-specific files
├── ios/                     # iOS-specific files
├── lib/
│   ├── main.dart           # App entry point
│   ├── models/             # Data models
│   │   └── property.dart   # Property model
│   ├── screens/            # UI screens
│   │   ├── splash_screen.dart
│   │   ├── onboarding_screen.dart
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   ├── question_screen.dart
│   │   ├── home_screen.dart
│   │   ├── confirm_email_screen.dart
│   │   └── estimate_budget_screen.dart
│   ├── services/           # Business logic & APIs
│   │   └── api_service.dart
│   └── widgets/            # Reusable components
│       └── property_card.dart
├── assets/                 # Images, fonts, etc.
├── test/                   # Unit & widget tests
├── pubspec.yaml           # Dependencies
└── README.md              # This file
```

---

## 🗺️ Roadmap

### ✅ Phase 1 (Q1 2026) - MVP Launch

- [x] Basic UI/UX design
- [x] Onboarding flow
- [x] User authentication (phone-based)
- [x] Property listing screen
- [x] Search & filters
- [ ] Map integration
- [ ] Favorites system
- [ ] Landlord contact (chat/call)
- [ ] Notifications
- [ ] Swahili localization

### 🔄 Phase 2 (Q2 2026) - Feature Enhancement

- [ ] Verified landlord badges
- [ ] In-app M-Pesa payments
- [ ] Digital rental agreements
- [ ] Property reviews & ratings
- [ ] Advanced search (AI-powered recommendations)
- [ ] Virtual property tours (video)
- [ ] Roommate matching

### 🌍 Phase 3 (Q3-Q4 2026) - Regional Expansion

- [ ] Expand to Kenya
- [ ] Expand to Uganda
- [ ] Multi-currency support
- [ ] Regional language support
- [ ] Landlord dashboard (web)
- [ ] Analytics & insights

### 🚀 Phase 4 (2027+) - Scale & Innovation

- [ ] AR property visualization
- [ ] Blockchain-based rental contracts
- [ ] Community features (tenant forums)
- [ ] Property management tools
- [ ] Home services marketplace

---

## 🎨 Design Philosophy

### Core Principles

1. **Simplicity First**: No unnecessary complexity
2. **Local Context**: Built for Tanzanian users
3. **Speed**: Fast loading, quick decisions
4. **Trust**: Transparent pricing, verified listings
5. **Accessibility**: Works on low-end devices, slow networks

### UI/UX Highlights

- **Clean Material Design**: Modern, familiar interface
- **Color Scheme**:
  - Primary: `#5B5FE9` (Trust blue)
  - Secondary: `#3DDCFF` (Energy cyan)
  - Accent: `#FFB86C` (Warmth orange)
- **Typography**: Google Fonts for clarity
- **Responsive**: Works on all screen sizes

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Ways to Contribute

1. 🐛 **Report bugs** - Open an issue with details
2. 💡 **Suggest features** - Share your ideas
3. 📝 **Improve documentation** - Fix typos, add examples
4. 🔧 **Submit pull requests** - Fix bugs or add features

### Contribution Guidelines

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Standards

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Write meaningful commit messages
- Add comments for complex logic
- Ensure code passes `flutter analyze`
- Write tests for new features

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 Contact & Support

### Get in Touch

- **Email**: support@homehub.co.tz
- **Twitter**: [@HomeHubTZ](https://twitter.com/homehubtz)
- **Instagram**: [@homehubtz](https://instagram.com/homehubtz)
- **Facebook**: [HomeHub Tanzania](https://facebook.com/homehubtz)

### For Landlords

Interested in listing your property? Contact us:

- **Landlord Email**: landlords@homehub.co.tz
- **WhatsApp**: +255 XXX XXX XXX

---

## 🙏 Acknowledgments

- **Flutter Team** - For the amazing framework
- **Tanzanian Tech Community** - For feedback and support
- **Early Testers** - For helping us improve
- **Open Source Contributors** - For valuable contributions

---

## 📊 Project Stats

![GitHub stars](https://img.shields.io/github/stars/yourusername/panga?style=social)
![GitHub forks](https://img.shields.io/github/forks/yourusername/panga?style=social)
![GitHub issues](https://img.shields.io/github/issues/yourusername/panga)
![GitHub pull requests](https://img.shields.io/github/issues-pr/yourusername/panga)

---

<div align="center">

**Made with ❤️ in Tanzania 🇹🇿**

_Empowering Tanzanians to find their dream homes_

[Download on App Store](#) | [Get it on Google Play](#)

</div>

---

## 🔖 Version History

### v1.0.0 (Current)

- Initial MVP release
- Basic authentication
- Property listing
- Search functionality
- Onboarding flow

---

**Last Updated**: January 2026  
**Maintained By**: Home Hub Development Team
