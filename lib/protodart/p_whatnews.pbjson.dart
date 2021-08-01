///
//  Generated code. Do not modify.
//  source: p_whatnews.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use whatNewsMsgDescriptor instead')
const whatNewsMsg$json = const {
  '1': 'whatNewsMsg',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.model.whatNewsMsg.whatNewsMsgType', '10': 'type'},
    const {'1': 'max_number_show', '3': 4, '4': 1, '5': 5, '10': 'maxNumberShow'},
    const {'1': 'is_enabled', '3': 5, '4': 1, '5': 5, '10': 'isEnabled'},
  ],
  '4': const [whatNewsMsg_whatNewsMsgType$json],
};

@$core.Deprecated('Use whatNewsMsgDescriptor instead')
const whatNewsMsg_whatNewsMsgType$json = const {
  '1': 'whatNewsMsgType',
  '2': const [
    const {'1': 'NOTHING', '2': 0},
    const {'1': 'EVENT_ICON', '2': 1},
    const {'1': 'KHAMPHA_ICON', '2': 2},
    const {'1': 'FOOTBALL_GUESS', '2': 3},
  ],
};

/// Descriptor for `whatNewsMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whatNewsMsgDescriptor = $convert.base64Decode('Cgt3aGF0TmV3c01zZxIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxlEjYKBHR5cGUYAyABKA4yIi5tb2RlbC53aGF0TmV3c01zZy53aGF0TmV3c01zZ1R5cGVSBHR5cGUSJgoPbWF4X251bWJlcl9zaG93GAQgASgFUg1tYXhOdW1iZXJTaG93Eh0KCmlzX2VuYWJsZWQYBSABKAVSCWlzRW5hYmxlZCJUCg93aGF0TmV3c01zZ1R5cGUSCwoHTk9USElORxAAEg4KCkVWRU5UX0lDT04QARIQCgxLSEFNUEhBX0lDT04QAhISCg5GT09UQkFMTF9HVUVTUxAD');
@$core.Deprecated('Use whatNewsResponseDescriptor instead')
const whatNewsResponse$json = const {
  '1': 'whatNewsResponse',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'desc', '3': 2, '4': 1, '5': 9, '10': 'desc'},
    const {'1': 'data', '3': 3, '4': 1, '5': 11, '6': '.model.whatNewsMsg', '10': 'data'},
  ],
};

/// Descriptor for `whatNewsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whatNewsResponseDescriptor = $convert.base64Decode('ChB3aGF0TmV3c1Jlc3BvbnNlEhIKBGNvZGUYASABKAVSBGNvZGUSEgoEZGVzYxgCIAEoCVIEZGVzYxImCgRkYXRhGAMgASgLMhIubW9kZWwud2hhdE5ld3NNc2dSBGRhdGE=');
