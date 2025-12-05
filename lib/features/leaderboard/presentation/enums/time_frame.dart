/// Time frame filter options for leaderboard
enum TimeFrame {
  today('Today', 'today'),
  week('Week', 'week'),
  month('Month', 'month'),
  allTime('All Time', 'allTime');

  const TimeFrame(this.label, this.value);
  final String label;
  final String value;
}
