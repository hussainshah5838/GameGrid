import 'package:logger/logger.dart';

final Logger _logger = Logger();

void prettyLogger(dynamic data) {
  final msg = data?.toString() ?? 'null';
  _logger.d(msg);
}
