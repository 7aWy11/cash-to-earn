import 'package:get_it/get_it.dart';

import 'core/network/api_client.dart';
import 'core/network/network_info.dart';

// Import data sources, repositories, use cases, and cubits as they are created

final sl = GetIt.instance;

/// Initialize dependency injection
Future<void> init() async {
  // =========================================================================
  // Core
  // =========================================================================

  // Network
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // =========================================================================
  // Features - Splash
  // =========================================================================

  // Cubit
  // sl.registerFactory(() => SplashCubit());

  
  
  // =========================================================================
  // Features - Auth
  // =========================================================================

  // Cubit
  // sl.registerFactory(() => AuthCubit(
  //       loginUser: sl(),
  //       signupUser: sl(),
  //       logoutUser: sl(),
  //     ));

  // Use Cases
  // sl.registerLazySingleton(() => LoginUser(sl()));
  // sl.registerLazySingleton(() => SignupUser(sl()));
  // sl.registerLazySingleton(() => LogoutUser(sl()));

  // Repository
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     remoteDataSource: sl(),
  //     localDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );

  // Data Sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(apiClient: sl()),
  // );
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //   () => AuthLocalDataSourceImpl(),
  // );

  // =========================================================================
  // Features - Home
  // =========================================================================

  // Cubit
  // sl.registerFactory(() => HomeCubit(
  //       getTrendingOffers: sl(),
  //       getTopGames: sl(),
  //       getAllOffers: sl(),
  //     ));

  // Use Cases
  // sl.registerLazySingleton(() => GetTrendingOffers(sl()));
  // sl.registerLazySingleton(() => GetTopGames(sl()));
  // sl.registerLazySingleton(() => GetAllOffers(sl()));

  // Repository
  // sl.registerLazySingleton<HomeRepository>(
  //   () => HomeRepositoryImpl(
  //     remoteDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );

  // Data Sources
  // sl.registerLazySingleton<HomeRemoteDataSource>(
  //   () => HomeRemoteDataSourceImpl(apiClient: sl()),
  // );

  // =========================================================================
  // Features - My Offers
  // =========================================================================

  // Similar pattern for My Offers feature

  // =========================================================================
  // Features - Cashout
  // =========================================================================

  // Similar pattern for Cashout feature

  // =========================================================================
  // Features - Profile
  // =========================================================================

  // Similar pattern for Profile feature

  // =========================================================================
  // Features - Main Navigation
  // =========================================================================

  // Cubit
  // sl.registerFactory(() => NavigationCubit());
}



