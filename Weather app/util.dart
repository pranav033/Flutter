

import 'package:intl/intl.dart';

class utils{

  static String appid = "ed60fcfbd110ee65c7150605ea8aceea";
  static String getformatteddate(DateTime dateTime)
  {
    return new DateFormat('EEEE, MMM d, y').format(dateTime);
  }

}