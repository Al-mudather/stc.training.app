import 'package:logger/logger.dart';

void LOG_THE_DEBUG_DATA(
    {required messag, type = 'i', error = 'Some thing wrong'}) {
  var logger = Logger();
  switch (type) {
    case 't': // Trace log
      logger.t(messag);
      break;
    case 'd': // Debug log
      logger.d(messag);
      break;
    case 'i': // Info log
      logger.i(messag);
      break;
    case 'w': // Warning log
      logger.w(messag);
      break;
    case 'e': // Error log
      logger.e(messag);
      break;
    case 'f': // What a fatal log
      logger.f(messag);
      break;
    default:
      logger.i(messag);
  }
}
