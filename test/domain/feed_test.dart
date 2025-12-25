import 'package:flutter_test/flutter_test.dart';
import 'package:my_rss/domain/models/feed.dart';
import 'package:rss_dart/dart_rss.dart';

void main() {
  test('fromRssFeed preserves provided id', () {
    const rss = RssFeed(title: 'T', link: 'https://example.com');
    final f = Feed.fromRssFeed(rss, id: 'my-id');
    expect(f.id, 'my-id');
  });

  test('fromRssFeed generates id when not provided', () {
    const rss = RssFeed(title: 'T', link: 'https://example.com');
    final f = Feed.fromRssFeed(rss);
    expect(f.id.length, 36);
    expect(f.id.contains('-'), isTrue);
  });
}
