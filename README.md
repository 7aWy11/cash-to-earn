# CashToEarn - Flutter App

A modern, feature-rich mobile application for earning cash through surveys, games, and various offers. Built with Flutter using Clean Architecture principles.

## 📱 Overview

CashToEarn allows users to earn money by:
- Completing surveys
- Playing games and reaching milestones
- Engaging with partner offers
- Participating in various in-app tasks

## 🏗️ Architecture

This project follows **Clean Architecture** with a **Feature-First** approach:

```
lib/
├── core/                    # Shared resources and utilities
│   ├── config/             # App configuration (router, theme)
│   ├── constants/          # App-wide constants
│   ├── network/            # API client and networking
│   ├── error/              # Error handling
│   ├── utils/              # Utility functions
│   └── widgets/            # Reusable UI components
│
├── features/               # Feature modules
│   ├── splash/
│   ├── onboarding/
│   ├── auth/
│   ├── home/
│   ├── my_offers/
│   ├── cashout/
│   ├── profile/
│   └── main_navigation/
│
└── injection_container.dart # Dependency injection setup
```

### Each Feature Module Contains:

- **Data Layer**: Models, Data Sources, Repository Implementations
- **Domain Layer**: Entities, Repository Interfaces, Use Cases
- **Presentation Layer**: Pages, Widgets, Cubit (State Management)

## 🛠️ Tech Stack

### State Management
- **flutter_bloc** (Cubit pattern)
- **equatable** (Value equality)

### Navigation
- **go_router** (Declarative routing)

### Networking
- **dio** (HTTP client)
- **pretty_dio_logger** (API logging)

### Dependency Injection
- **get_it** (Service locator)

### UI & Responsiveness
- **flutter_screenutil** (Responsive sizing)
- **animate_do** (Animations)
- **shimmer** (Loading effects)
- **smooth_page_indicator** (Page indicators)
- **cached_network_image** (Image caching)
- **flutter_svg** (SVG support)

### Utilities
- **dartz** (Functional programming - Either type)

## 🎨 Design System

### Color Palette
- **Primary Purple**: `#8B5CF6` (Main actions)
- **Vibrant Blue**: `#3B82F6` (Accents)
- **Success Green**: `#10B981` (Positive actions)
- **Warning Orange**: `#F97316` (Alerts)
- **Error Red**: `#EF4444` (Errors)
- **Background**: `#0F0F1A` (Dark theme)
- **Card Background**: `#1A1A2E` (Elevated surfaces)

### Typography
- Responsive font sizes using `.sp` from ScreenUtil
- Custom text styles for headings, body, and captions

### Spacing
- Consistent spacing using `.w` and `.h` from ScreenUtil
- Design base: 375x812 (iPhone standard)

## 📂 Project Structure Details

### Core Modules

#### 1. Config
- **Router**: GoRouter configuration with route guards
- **Theme**: Dark theme with custom colors and styles

#### 2. Network
- **API Client**: Dio instance with interceptors
- **API Endpoints**: Centralized endpoint management
- **Network Info**: Connectivity checks

#### 3. Error Handling
- **Exceptions**: Custom exception classes
- **Failures**: Either pattern for error handling

#### 4. Common Widgets
- Custom buttons with gradients
- Text fields with validation
- Loading indicators
- Error widgets
- Gradient backgrounds

### Features

#### 1. Splash
- App initialization
- Route to onboarding or home based on user status

#### 2. Onboarding
- Welcome screen with consent
- Tutorial overlays
- First-time user experience

#### 3. Authentication
- Landing screen
- Create account (Email/Google/Facebook UI)
- Personalization (Gender, Country)
- Username & Avatar selection

#### 4. Home
- Trending offers
- Top games with milestone rewards
- Offer partners
- Premium partners
- Survey opportunities
- In-app tasks
- Live payouts feed

#### 5. My Offers
- Recent activity
- Performance analytics
- Offer tracking

#### 6. Cashout
- Balance display
- Payment method selection (PayPal, Venmo, Cash App, etc.)
- Withdrawal interface
- Crypto options
- Gift cards

#### 7. Profile
- User information
- Settings
- Statistics
- Referrals
- Rewards
- Leaderboard

#### 8. Main Navigation
- Persistent bottom navigation
- Side drawer menu
- Tab management

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: ^3.9.2
- Dart SDK: ^3.9.2
- IDE: VS Code or Android Studio

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd cash-to-earn
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

### Build for Production

**Android:**
```bash
flutter build apk --release
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/auth/auth_cubit_test.dart
```

## 📝 Development Guidelines

### State Management with Cubit

```dart
// 1. Define states
abstract class MyState extends Equatable {}

class MyInitial extends MyState {}
class MyLoading extends MyState {}
class MySuccess extends MyState {
  final Data data;
  MySuccess(this.data);
}
class MyError extends MyState {
  final String message;
  MyError(this.message);
}

// 2. Create Cubit
class MyCubit extends Cubit<MyState> {
  final UseCase useCase;
  
  MyCubit(this.useCase) : super(MyInitial());
  
  Future<void> fetchData() async {
    emit(MyLoading());
    final result = await useCase();
    result.fold(
      (failure) => emit(MyError(failure.message)),
      (data) => emit(MySuccess(data)),
    );
  }
}
```

### Clean Architecture Layers

**Domain Layer (Business Logic)**
```dart
// Entity
class User {
  final String id;
  final String name;
  User({required this.id, required this.name});
}

// Repository Interface
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
}

// Use Case
class GetUser {
  final UserRepository repository;
  GetUser(this.repository);
  
  Future<Either<Failure, User>> call(String id) {
    return repository.getUser(id);
  }
}
```

**Data Layer (Implementation)**
```dart
// Model
class UserModel extends User {
  UserModel({required super.id, required super.name});
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

// Repository Implementation
class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  
  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final user = await remoteDataSource.getUser(id);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
```

### Responsive Design with ScreenUtil

```dart
// Sizes
Container(
  width: 200.w,      // Responsive width
  height: 100.h,     // Responsive height
  padding: EdgeInsets.all(16.w),
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 16.sp),  // Responsive font
  ),
)

// Border radius
BorderRadius.circular(12.r)
```

## 🔐 Environment Variables

Create `.env` file for sensitive data:
```
API_BASE_URL=https://api.cashtoearn.com
API_KEY=your_api_key
```

## 📱 Supported Platforms

- ✅ iOS
- ✅ Android
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 🤝 Contributing

1. Create a feature branch
2. Follow the existing architecture pattern
3. Write tests for new features
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 👥 Team

- **Tech Lead**: [Your Name]
- **Senior Developer**: AI Assistant

## 📞 Contact

For questions or support, contact: [your-email@example.com]

---

**Built with ❤️ using Flutter**
