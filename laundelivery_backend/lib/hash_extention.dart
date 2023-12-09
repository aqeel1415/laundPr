

// a dart extension is a methoid just extends a functionality of libray or a class e.g String

import 'dart:convert';

import 'package:crypto/crypto.dart';

//add hash functinality to our string id
extension HashStringExtention on String{

  // return the SHA256 hash of this [String]
  String get hashValue{
    return sha256.convert(utf8.encode(this)).toString();
  }
}
