class TrendingOffer {
  final String id;
  final String title;
  final String description;
  final String userCount;
  final String reward;
  final String rating;
  final String? iconUrl;
  final String? category;
  final String? imageUrl;

  const TrendingOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.userCount,
    required this.reward,
    required this.rating,
    this.iconUrl,
    this.category,
    this.imageUrl,
  });

  // Sample data for demonstration
  static List<TrendingOffer> get sampleOffers => [
    const TrendingOffer(
      id: '1',
      title: 'Notik - Mini Games: Calm & Relax',
      description: 'Play relaxing mini-games for 10 minutes',
      userCount: '1.2k',
      reward: '\$56.40',
      rating: '5',
      category: 'Gaming',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const TrendingOffer(
      id: '2',
      title: 'Notik - Word Madness',
      description: 'Complete word puzzles and reach level 5',
      userCount: '880',
      reward: '\$87.00',
      rating: '4',
      category: 'Puzzle',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const TrendingOffer(
      id: '3',
      title: 'Ever Legion',
      description: 'Build your army and conquer kingdoms',
      userCount: '2.1k',
      reward: '\$300.01',
      rating: '5',
      category: 'Strategy',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const TrendingOffer(
      id: '4',
      title: 'Coin Master',
      description: 'Spin and build your village',
      userCount: '1.8k',
      reward: '\$45.20',
      rating: '4',
      category: 'Casual',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const TrendingOffer(
      id: '5',
      title: 'Candy Crush Saga',
      description: 'Match candies and complete levels',
      userCount: '3.2k',
      reward: '\$25.50',
      rating: '5',
      category: 'Puzzle',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const TrendingOffer(
      id: '6',
      title: 'PUBG Mobile',
      description: 'Battle royale survival game',
      userCount: '4.5k',
      reward: '\$120.75',
      rating: '5',
      category: 'Action',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const TrendingOffer(
      id: '7',
      title: 'Among Us',
      description: 'Find the impostor among crewmates',
      userCount: '1.9k',
      reward: '\$35.80',
      rating: '4',
      category: 'Social',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const TrendingOffer(
      id: '8',
      title: 'Clash of Clans',
      description: 'Build your village and attack others',
      userCount: '2.8k',
      reward: '\$95.30',
      rating: '5',
      category: 'Strategy',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];
}
