class TopGameOffer {
  final String id;
  final String title;
  final String reward;
  final String rating;
  final String imageUrl;
  final String? category;

  const TopGameOffer({
    required this.id,
    required this.title,
    required this.reward,
    required this.rating,
    required this.imageUrl,
    this.category,
  });

  // Sample data for demonstration
  static List<TopGameOffer> get sampleOffers => [
    const TopGameOffer(
      id: '1',
      title: 'Ever Legion',
      reward: '\$300.01',
      rating: '5',
      imageUrl:
          'https://devimages-cdn.apple.com/wwdc-services/articles/images/3D5F5DD3-14F7-4384-94C0-798D15EE7CD7/2048.jpeg',
      category: 'Strategy',
    ),
    const TopGameOffer(
      id: '2',
      title: 'PUBG Mobile',
      reward: '\$120.75',
      rating: '5',
      imageUrl:
          'https://devimages-cdn.apple.com/wwdc-services/articles/images/3D5F5DD3-14F7-4384-94C0-798D15EE7CD7/2048.jpeg',
      category: 'Action',
    ),
    const TopGameOffer(
      id: '3',
      title: 'Clash of Clans',
      reward: '\$95.30',
      rating: '5',
      imageUrl:
          'https://devimages-cdn.apple.com/wwdc-services/articles/images/3D5F5DD3-14F7-4384-94C0-798D15EE7CD7/2048.jpeg',
      category: 'Strategy',
    ),
    const TopGameOffer(
      id: '4',
      title: 'Candy Crush Saga',
      reward: '\$25.50',
      rating: '5',
      imageUrl:
          'https://devimages-cdn.apple.com/wwdc-services/articles/images/3D5F5DD3-14F7-4384-94C0-798D15EE7CD7/2048.jpeg',
      category: 'Puzzle',
    ),
    const TopGameOffer(
      id: '5',
      title: 'Among Us',
      reward: '\$35.80',
      rating: '4',
      imageUrl:
          'https://devimages-cdn.apple.com/wwdc-services/articles/images/3D5F5DD3-14F7-4384-94C0-798D15EE7CD7/2048.jpeg',
      category: 'Social',
    ),
    const TopGameOffer(
      id: '6',
      title: 'Coin Master',
      reward: '\$45.20',
      rating: '4',
      imageUrl:
          'https://devimages-cdn.apple.com/wwdc-services/articles/images/3D5F5DD3-14F7-4384-94C0-798D15EE7CD7/2048.jpeg',
      category: 'Casual',
    ),
  ];
}
