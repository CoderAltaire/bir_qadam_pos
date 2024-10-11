// ignore_for_file: constant_identifier_names

class AppSecurityLinks {
  const AppSecurityLinks._();
  static const List<String> phones = ['+998931881333'];
  ///////////////////////////////////////////////////
  static const String BOT_TOKEN =
      '5134603007:AAGmWyBVIzPBhEg8Pf7wbiBYM-46cyRRKJk';
  ///////////////////////////////////////////////////
  static const String ORDER_BOT_TOKEN =
      '6755462374:AAEUKADXg2is6YGxUZIh7gNXwYo6pgjgK6Q';
  ///////////////////////////////////////////////////
  static const String CHANNEL_ID = '-1001632999120';
  ///////////////////////////////////////////////////
  static const String ORDER_CHANNEL_ID = '-1002173857111';
  ///////////////////////////////////////////////////
  // static const String TELEGRAM_BOT_LINK =
  //     'https://api.telegram.org/bot5134603007:AAGmWyBVIzPBhEg8Pf7wbiBYM-46cyRRKJk/sendMessage?chat_id=-1001632999120&parse_mode=html&text=';
  static const String TELEGRAM_BOT_LINK =
      'https://api.telegram.org/bot$BOT_TOKEN/sendMessage?chat_id=$CHANNEL_ID&parse_mode=html&text=';

  static const String TELEGRAM_ORDERBOT_LINK =
      'https://api.telegram.org/bot$ORDER_BOT_TOKEN/sendMessage?chat_id=$ORDER_CHANNEL_ID&parse_mode=html&text=';
}
