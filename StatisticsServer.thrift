struct StatisticsEvent {
  1: i64 timestamp,
  2: i64 value,
}

service StatisticsServerHandler {
    StatisticsEvent appendEvent(1: StatisticsEvent event);
}