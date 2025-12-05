# Leaderboard Feature

A comprehensive leaderboard feature showcasing top-performing users with an elegant UI design.

## 🎯 Features

- **Top 3 Podium Display**: Special visual treatment for the top 3 users
- **Crown for #1**: First place gets a crown icon above their avatar
- **Medal Badges**: Gold, Silver, and Bronze medals for ranks 1-3
- **Dynamic Heights**: Podium heights vary (1st: tallest, 2nd: medium, 3rd: shortest)
- **Time Frame Filters**: View leaderboard by Today, Week, Month, or All Time
- **Current User Highlight**: User's own rank is highlighted in the list
- **Pull to Refresh**: Easy data refresh with pull-down gesture
- **Responsive Design**: Fully responsive using ScreenUtil

## 📁 Structure

```
leaderboard/
├── data/
│   └── mock_leaderboard_data.dart        # Mock data provider
├── domain/
│   └── entities/
│       └── leaderboard_user.dart         # User entity with rank and earnings
├── presentation/
│   ├── enums/
│   │   └── time_frame.dart              # TimeFrame enum (Today, Week, Month, All Time)
│   ├── pages/
│   │   └── leaderboard_screen.dart      # Main leaderboard screen (clean & minimal)
│   └── widgets/
│       ├── leaderboard_app_bar.dart     # Custom AppBar widget
│       ├── leaderboard_info_dialog.dart # Info dialog widget
│       ├── leaderboard_list_item.dart   # Individual user list item
│       ├── time_frame_filter.dart       # Time frame filter chips widget
│       └── top_three_podium.dart        # Top 3 users podium widget
└── leaderboard.dart                      # Feature exports
```

## 🚀 Usage

### Basic Usage

```dart
import 'package:cash_to_earn/features/leaderboard/leaderboard.dart';

// Navigate to leaderboard
context.push('/leaderboard');

// Or use directly
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
);
```

### Using Mock Data

The feature currently uses `MockLeaderboardData` for testing:

```dart
// Get mock users
final users = MockLeaderboardData.getUsers();

// Get current user rank
final rank = MockLeaderboardData.currentUserRank;
```

## 🎨 UI Components

### 1. LeaderboardAppBar
Custom AppBar with:
- Back button
- Title: "Leaderboard"
- Info button (opens help dialog)

```dart
LeaderboardAppBar(
  onInfoPressed: () => LeaderboardInfoDialog.show(context),
)
```

### 2. TimeFrameFilter
Time period selector with chips:
- **Today**: Today's leaderboard
- **Week**: This week's rankings
- **Month**: This month's data
- **All Time**: Overall rankings (default)

```dart
TimeFrameFilter(
  currentTimeFrame: _currentTimeFrame,
  onTimeFrameChanged: (timeFrame) {
    setState(() => _currentTimeFrame = timeFrame);
  },
)
```

### 3. TopThreePodium
The podium displays the top 3 users with:
- **1st Place**: Crown icon, gold gradient, largest avatar, tallest podium
- **2nd Place**: Silver medal, purple-blue gradient, medium height
- **3rd Place**: Bronze medal, green gradient, shortest height

```dart
TopThreePodium(topThreeUsers: _topThreeUsers)
```

### 4. LeaderboardListItem
Other users (rank 4+) are displayed in a scrollable list with:
- Rank number with color coding (top 5: gold, top 10: blue, others: gray)
- User avatar with border
- Username and completed offers count
- Total earnings in green
- Country badge (if available)
- "You" badge for current user

```dart
LeaderboardListItem(
  user: user,
  isCurrentUser: isCurrentUser,
)
```

### 5. LeaderboardInfoDialog
Info dialog explaining leaderboard features:
- Top 3 recognition
- Rankings based on earnings
- Real-time updates
- Climb up by completing offers

```dart
LeaderboardInfoDialog.show(context)
```

## 📊 Data Structure

### LeaderboardUser Entity

```dart
LeaderboardUser(
  id: 'user_id',
  username: 'Username',
  avatarUrl: 'https://...', // optional
  rank: 1,
  totalEarnings: 2547.50,
  completedOffers: 342,
  country: 'US', // optional
)
```

## 🔄 State Management

The feature uses **StatefulWidget** for simple local state management:

```dart
class _LeaderboardScreenState extends State<LeaderboardScreen> {
  TimeFrame _currentTimeFrame = TimeFrame.allTime;
  List<LeaderboardUser> _users = [];
  
  Future<void> _loadData() async {
    setState(() {
      _users = MockLeaderboardData.getUsers();
    });
  }
}
```

### TimeFrame Enum

```dart
enum TimeFrame {
  today('Today', 'today'),
  week('Week', 'week'),
  month('Month', 'month'),
  allTime('All Time', 'allTime');

  const TimeFrame(this.label, this.value);
  final String label;
  final String value;
}
```

## 🎨 Assets Required

Add these assets to your project:

```yaml
# pubspec.yaml
assets:
  - assets/icons/crown.png      # Crown for 1st place
  - assets/icons/gold.png        # Gold medal
  - assets/icons/silver.png      # Silver medal
  - assets/icons/bronze.png      # Bronze medal
```

## 🔌 Integration

### Add Route

```dart
// In app_router.dart
GoRoute(
  path: '/leaderboard',
  name: RouteNames.leaderboard,
  builder: (context, state) => const LeaderboardScreen(),
),
```

### Add to Navigation

```dart
// From profile screen
ProfileListItem(
  title: 'Leaderboard',
  subtitle: 'See top earning users',
  onTap: () => context.push('/leaderboard'),
),
```

## 🎯 Customization

### Add Custom Time Frames

Edit `presentation/enums/time_frame.dart`:

```dart
enum TimeFrame {
  today('Today', 'today'),
  week('Week', 'week'),
  month('Month', 'month'),
  allTime('All Time', 'allTime'),
  custom('Custom', 'custom'); // Add new option
  
  const TimeFrame(this.label, this.value);
  final String label;
  final String value;
}
```

### Customize AppBar

Edit `presentation/widgets/leaderboard_app_bar.dart`:

```dart
LeaderboardAppBar(
  onInfoPressed: () => LeaderboardInfoDialog.show(context),
  // Add more customization options
)
```

### Change Podium Colors

Edit `top_three_podium.dart`:

```dart
gradient: rank == 1
  ? AppGradients.gold          // 1st place gradient
  : rank == 2
    ? AppGradients.blueCyan    // 2nd place gradient
    : AppGradients.greenSuccess // 3rd place gradient
```

### Modify Rank Colors

Edit `leaderboard_list_item.dart`:

```dart
Color _getRankColor() {
  if (user.rank <= 5) return AppColors.goldYellow;
  if (user.rank <= 10) return AppColors.vibrantBlue;
  return AppColors.textSecondary;
}
```

### Update Mock Data

Edit `data/mock_leaderboard_data.dart`:

```dart
class MockLeaderboardData {
  static const int currentUserRank = 15; // Change user rank
  
  static List<LeaderboardUser> getUsers() {
    return const [
      // Add or modify users
    ];
  }
}
```

## 📝 TODO: Backend Integration

Currently uses mock data from `MockLeaderboardData`. To integrate with real API:

### Step 1: Create Data Layer
```
data/
├── models/
│   └── leaderboard_user_model.dart    # JSON serializable model
├── datasources/
│   └── leaderboard_remote_datasource.dart
└── repositories/
    └── leaderboard_repository_impl.dart
```

### Step 2: Create Domain Layer
```
domain/
├── repositories/
│   └── leaderboard_repository.dart    # Abstract interface
└── usecases/
    ├── get_leaderboard.dart
    └── get_current_user_rank.dart
```

### Step 3: Add State Management (Optional)
```
presentation/
└── cubit/
    ├── leaderboard_cubit.dart
    └── leaderboard_state.dart
```

### Step 4: Update Screen

Replace mock data call in `leaderboard_screen.dart`:

```dart
// Before (current)
Future<void> _loadData() async {
  setState(() {
    _users = MockLeaderboardData.getUsers();
  });
}

// After (with backend)
Future<void> _loadData() async {
  setState(() => _isLoading = true);
  try {
    final users = await getLeaderboardUseCase(
      timeFrame: _currentTimeFrame.value,
    );
    setState(() {
      _users = users;
      _isLoading = false;
    });
  } catch (e) {
    setState(() {
      _error = e.toString();
      _isLoading = false;
    });
  }
}
```

### Step 5: API Integration Example

```dart
// data/datasources/leaderboard_remote_datasource.dart
abstract class LeaderboardRemoteDataSource {
  Future<List<LeaderboardUserModel>> getLeaderboard(String timeFrame);
  Future<int> getCurrentUserRank();
}

class LeaderboardRemoteDataSourceImpl implements LeaderboardRemoteDataSource {
  final Dio client;
  
  @override
  Future<List<LeaderboardUserModel>> getLeaderboard(String timeFrame) async {
    final response = await client.get(
      '/api/leaderboard',
      queryParameters: {'timeFrame': timeFrame},
    );
    
    return (response.data as List)
        .map((json) => LeaderboardUserModel.fromJson(json))
        .toList();
  }
  
  @override
  Future<int> getCurrentUserRank() async {
    final response = await client.get('/api/leaderboard/my-rank');
    return response.data['rank'];
  }
}
```

## 🎨 Design Specifications

- **Screen**: Full screen with app bar
- **Background**: Dark theme (`AppColors.backgroundDark`)
- **Podium Heights**: 1st: 180h, 2nd: 140h, 3rd: 120h
- **Avatar Sizes**: 1st: 36r, 2nd/3rd: 32r
- **Spacing**: Consistent with ScreenUtil (.w, .h, .r)
- **Colors**: From `AppColors` and `AppGradients`

## 📱 Screenshots

The leaderboard features:
1. Top section with time frame filter
2. "Top Earners" podium with 3 users
3. Divider and "All Rankings" header
4. Scrollable list of remaining users
5. Pull-to-refresh functionality

## ⚡ Performance

- Optimized list rendering with `SliverList`
- Efficient state management with StatefulWidget
- Image caching for avatars
- Widget separation for better rebuild optimization
- Const constructors where possible
- Minimal widget tree depth

## 🐛 Error Handling

When integrating with backend, add:
- Network errors: Show error widget with retry button
- Empty states: Display "No data available" message
- Image loading errors: Fall back to user initials
- Loading states: Show shimmer or skeleton loaders

```dart
// Example error handling
Future<void> _loadData() async {
  try {
    setState(() => _isLoading = true);
    _users = await fetchLeaderboard();
  } catch (e) {
    setState(() => _error = e.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load leaderboard: $e')),
    );
  } finally {
    setState(() => _isLoading = false);
  }
}
```

## 🔐 Security Notes

When integrating with backend:
- Validate user permissions before showing leaderboard
- Sanitize user data (usernames, avatars)
- Implement rate limiting for refresh
- Cache data appropriately

## 🏗️ Architecture Benefits

### Clean & Modular
- **143 lines** in main screen (vs 403 before) - 64% reduction
- Separated widgets for better maintainability
- Easy to test individual components
- Reusable widgets across the app

### Files Created
1. `leaderboard_app_bar.dart` - 45 lines
2. `time_frame_filter.dart` - 62 lines
3. `leaderboard_info_dialog.dart` - 95 lines
4. `mock_leaderboard_data.dart` - 112 lines
5. `time_frame.dart` - 9 lines (enum)

### Benefits
- ✅ **Separation of Concerns**: Each widget has a single responsibility
- ✅ **Reusability**: Widgets can be used in other screens
- ✅ **Testability**: Easy to unit test individual components
- ✅ **Maintainability**: Changes are isolated and easy to make
- ✅ **Readability**: Clean and easy to understand code

---

## 📚 Additional Resources

### Related Files
- `core/config/theme/app_colors.dart` - Color definitions
- `core/config/theme/app_text_styles.dart` - Text styles
- `core/config/theme/app_gradients.dart` - Gradient definitions
- `core/constants/asset_paths.dart` - Asset path constants

### Dependencies
```yaml
dependencies:
  flutter_screenutil: ^5.9.3  # Responsive design
  go_router: ^14.8.1          # Navigation
  equatable: ^2.0.5           # Entity comparison
```

---

**Created**: November 3, 2025  
**Updated**: November 3, 2025  
**Version**: 2.0.0  
**Status**: ✅ Complete (Clean architecture, UI ready, backend integration pending)
