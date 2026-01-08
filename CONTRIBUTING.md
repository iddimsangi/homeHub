# Contributing to Home Hub Tanzania 🇹🇿

First off, thank you for considering contributing to Home Hub! It's people like you that make Home Hub such a great tool for connecting Tanzanians with their dream homes.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Features](#suggesting-features)

---

## 🤝 Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

### Our Pledge

- Be respectful and inclusive
- Accept constructive criticism
- Focus on what's best for the community
- Show empathy towards other community members

---

## 🎯 How Can I Contribute?

### 1. Reporting Bugs 🐛

Before creating bug reports, please check existing issues to avoid duplicates.

**Good Bug Report Includes:**

- Clear, descriptive title
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Device/OS information
- App version

**Example:**

```markdown
**Title:** Property card images not loading on Android 11

**Steps to Reproduce:**

1. Open app on Android 11 device
2. Navigate to home screen
3. Scroll through property listings

**Expected:** Images should load
**Actual:** Placeholder images shown

**Device:** Samsung Galaxy S21, Android 11
**App Version:** 1.0.0
```

### 2. Suggesting Features 💡

We love new ideas! Here's how to suggest features:

**Feature Request Template:**

```markdown
**Feature Name:** [Brief name]

**Problem:** What problem does this solve?

**Solution:** How would it work?

**Benefits:** Why is this valuable?

**Alternatives:** Any other approaches considered?

**Additional Context:** Screenshots, mockups, etc.
```

### 3. Contributing Code 💻

#### Types of Contributions Welcome

- 🐛 Bug fixes
- ✨ New features
- 📝 Documentation improvements
- 🎨 UI/UX enhancements
- 🌍 Translations (Swahili improvements)
- ⚡ Performance improvements
- ✅ Test coverage

---

## 🛠️ Development Setup

### Prerequisites

- Flutter SDK 3.6.1+
- Dart 3.6.1+
- Git
- Android Studio or Xcode
- VS Code (recommended)

### Setup Steps

1. **Fork the repository**

   - Click "Fork" on GitHub
   - Clone your fork:

   ```bash
   git clone https://github.com/YOUR_USERNAME/panga.git
   cd panga
   ```

2. **Add upstream remote**

   ```bash
   git remote add upstream https://github.com/ORIGINAL_OWNER/panga.git
   ```

3. **Install dependencies**

   ```bash
   flutter pub get
   ```

4. **Verify setup**

   ```bash
   flutter doctor
   flutter analyze
   ```

5. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

---

## 📝 Coding Standards

### Dart Style Guide

Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines.

### Key Principles

#### 1. Naming Conventions

```dart
// Classes: PascalCase
class PropertyCard extends StatelessWidget {}

// Variables/Functions: camelCase
String landlordName = 'John Doe';
void fetchProperties() {}

// Constants: lowerCamelCase with const
const primaryColor = Color(0xFF5B5FE9);

// Private: prefix with underscore
String _authToken;
void _helperFunction() {}
```

#### 2. File Organization

```dart
// 1. Imports (Flutter first, then packages, then relative)
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/property.dart';

// 2. Main class

// 3. State class (if StatefulWidget)

// 4. Private methods

// 5. Helper widgets
```

#### 3. Code Formatting

```bash
# Format before committing
flutter format lib/

# Or configure auto-format in VS Code
# settings.json:
{
  "editor.formatOnSave": true,
  "[dart]": {
    "editor.formatOnSave": true
  }
}
```

#### 4. Comments

```dart
/// Public API: Use doc comments
/// Fetches all properties from the server
Future<List<Property>> getProperties() {}

// Private: Use regular comments for implementation details
// TODO: Add caching mechanism
```

#### 5. Widget Composition

```dart
// ✅ Good: Extract widgets
Widget _buildHeader() {
  return Container(/* ... */);
}

// ❌ Avoid: Deeply nested widgets
build() {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Container(/* ... */),
          ],
        ),
      ],
    ),
  );
}
```

### Tanzania-Specific Guidelines

1. **Currency:** Always use TZS, never USD

   ```dart
   // ✅ Good
   final price = 'TZS 500,000';

   // ❌ Bad
   final price = '$500';
   ```

2. **Phone Numbers:** Use +255 format

   ```dart
   // ✅ Good
   final phone = '+255712345678';

   // ❌ Bad
   final phone = '0712345678';
   ```

3. **Locations:** Use Tanzanian place names

   ```dart
   // ✅ Good
   final areas = ['Kigamboni', 'Mbezi Beach', 'Mikocheni'];
   ```

4. **Language:** Provide both English and Swahili
   ```dart
   // Use localization service
   final loc = AppLocalizations.of(context)!;
   Text(loc.hello); // "Hello!" or "Habari!"
   ```

---

## 📝 Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting changes
- `refactor`: Code restructuring
- `perf`: Performance improvements
- `test`: Adding tests
- `chore`: Build/tooling changes

### Examples

```bash
# Good commits
git commit -m "feat(property): add favorites functionality"
git commit -m "fix(auth): resolve OTP verification issue"
git commit -m "docs: update README with setup instructions"

# Bad commits (avoid these)
git commit -m "fixed stuff"
git commit -m "updates"
git commit -m "asdfasdf"
```

### Detailed Example

```
feat(map): add Google Maps integration

- Implement property markers
- Add user location tracking
- Include directions to properties

Closes #123
```

---

## 🔄 Pull Request Process

### Before Submitting

1. **Update from upstream**

   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Test your changes**

   ```bash
   flutter test
   flutter analyze
   ```

3. **Format code**

   ```bash
   flutter format lib/
   ```

4. **Update documentation**
   - Update README if needed
   - Add comments to complex code
   - Update CHANGELOG.md

### Creating Pull Request

1. **Push to your fork**

   ```bash
   git push origin feature/your-feature-name
   ```

2. **Open PR on GitHub**
   - Use clear, descriptive title
   - Reference related issues
   - Include screenshots for UI changes
   - List all changes made

### PR Template

```markdown
## Description

Brief description of changes

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing

How was this tested?

## Screenshots (if applicable)

Before | After

## Checklist

- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] Tests pass
- [ ] No new warnings
```

### Review Process

- Maintainers will review within 3-5 days
- Address feedback promptly
- Keep discussions respectful
- Be patient during review

---

## 🎨 UI/UX Contributions

### Design Guidelines

- Follow Material Design 3
- Use existing color scheme
- Maintain consistency
- Test on multiple screen sizes
- Consider accessibility

### Before & After Screenshots

Always include:

- Original state
- Your changes
- Different screen sizes
- Dark mode (if applicable)

---

## 🌍 Translation Contributions

### Adding Swahili Translations

Edit: `lib/services/localization_service.dart`

```dart
// Add to _swahili map
const Map<String, String> _swahili = {
  'new_key': 'Tafsiri ya Kiswahili',
  // ...
};

// Add to _english map too
const Map<String, String> _english = {
  'new_key': 'English Translation',
  // ...
};
```

### Translation Guidelines

- Use simple, clear language
- Be culturally appropriate
- Maintain consistent tone
- Test in app before submitting

---

## ✅ Testing

### Write Tests For

- New features
- Bug fixes
- Complex logic
- UI components

### Test Example

```dart
// test/models/property_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:panga/models/property.dart';

void main() {
  group('Property Tests', () {
    test('Formats TZS price correctly', () {
      final property = Property(/* ... */);
      expect(
        property.getFormattedPrice(RentalPeriod.monthly),
        'TZS 500,000',
      );
    });
  });
}
```

---

## 📚 Resources

### Learning

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart)
- [Material Design](https://material.io/)

### Tools

- [Flutter DevTools](https://docs.flutter.dev/development/tools/devtools/overview)
- [VS Code Flutter Extensions](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

---

## ❓ Questions?

- **General Questions:** Open a [Discussion](https://github.com/yourrepo/discussions)
- **Bugs:** Open an [Issue](https://github.com/yourrepo/issues)
- **Chat:** Join our [Discord/Slack](#) (coming soon)

---

## 🙏 Recognition

Contributors will be:

- Listed in README
- Mentioned in release notes
- Given credit in CHANGELOG

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to Home Hub Tanzania! 🏠🇹🇿**
