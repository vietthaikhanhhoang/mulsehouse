///
//  Generated code. Do not modify.
//  source: p_whatnews.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class whatNewsMsg_whatNewsMsgType extends $pb.ProtobufEnum {
  static const whatNewsMsg_whatNewsMsgType NOTHING = whatNewsMsg_whatNewsMsgType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOTHING');
  static const whatNewsMsg_whatNewsMsgType EVENT_ICON = whatNewsMsg_whatNewsMsgType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_ICON');
  static const whatNewsMsg_whatNewsMsgType KHAMPHA_ICON = whatNewsMsg_whatNewsMsgType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KHAMPHA_ICON');
  static const whatNewsMsg_whatNewsMsgType FOOTBALL_GUESS = whatNewsMsg_whatNewsMsgType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FOOTBALL_GUESS');

  static const $core.List<whatNewsMsg_whatNewsMsgType> values = <whatNewsMsg_whatNewsMsgType> [
    NOTHING,
    EVENT_ICON,
    KHAMPHA_ICON,
    FOOTBALL_GUESS,
  ];

  static final $core.Map<$core.int, whatNewsMsg_whatNewsMsgType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static whatNewsMsg_whatNewsMsgType? valueOf($core.int value) => _byValue[value];

  const whatNewsMsg_whatNewsMsgType._($core.int v, $core.String n) : super(v, n);
}

