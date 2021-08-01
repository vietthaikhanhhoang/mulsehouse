///
//  Generated code. Do not modify.
//  source: p_whatnews.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'p_whatnews.pbenum.dart';

export 'p_whatnews.pbenum.dart';

class whatNewsMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'whatNewsMsg', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..e<whatNewsMsg_whatNewsMsgType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: whatNewsMsg_whatNewsMsgType.NOTHING, valueOf: whatNewsMsg_whatNewsMsgType.valueOf, enumValues: whatNewsMsg_whatNewsMsgType.values)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxNumberShow', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isEnabled', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  whatNewsMsg._() : super();
  factory whatNewsMsg({
    $core.int? id,
    $core.String? title,
    whatNewsMsg_whatNewsMsgType? type,
    $core.int? maxNumberShow,
    $core.int? isEnabled,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
    }
    if (maxNumberShow != null) {
      _result.maxNumberShow = maxNumberShow;
    }
    if (isEnabled != null) {
      _result.isEnabled = isEnabled;
    }
    return _result;
  }
  factory whatNewsMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory whatNewsMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  whatNewsMsg clone() => whatNewsMsg()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  whatNewsMsg copyWith(void Function(whatNewsMsg) updates) => super.copyWith((message) => updates(message as whatNewsMsg)) as whatNewsMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static whatNewsMsg create() => whatNewsMsg._();
  whatNewsMsg createEmptyInstance() => create();
  static $pb.PbList<whatNewsMsg> createRepeated() => $pb.PbList<whatNewsMsg>();
  @$core.pragma('dart2js:noInline')
  static whatNewsMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<whatNewsMsg>(create);
  static whatNewsMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  whatNewsMsg_whatNewsMsgType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(whatNewsMsg_whatNewsMsgType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxNumberShow => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxNumberShow($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxNumberShow() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxNumberShow() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get isEnabled => $_getIZ(4);
  @$pb.TagNumber(5)
  set isEnabled($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsEnabled() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsEnabled() => clearField(5);
}

class whatNewsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'whatNewsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'desc')
    ..aOM<whatNewsMsg>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: whatNewsMsg.create)
    ..hasRequiredFields = false
  ;

  whatNewsResponse._() : super();
  factory whatNewsResponse({
    $core.int? code,
    $core.String? desc,
    whatNewsMsg? data,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory whatNewsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory whatNewsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  whatNewsResponse clone() => whatNewsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  whatNewsResponse copyWith(void Function(whatNewsResponse) updates) => super.copyWith((message) => updates(message as whatNewsResponse)) as whatNewsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static whatNewsResponse create() => whatNewsResponse._();
  whatNewsResponse createEmptyInstance() => create();
  static $pb.PbList<whatNewsResponse> createRepeated() => $pb.PbList<whatNewsResponse>();
  @$core.pragma('dart2js:noInline')
  static whatNewsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<whatNewsResponse>(create);
  static whatNewsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  whatNewsMsg get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(whatNewsMsg v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  whatNewsMsg ensureData() => $_ensure(2);
}

