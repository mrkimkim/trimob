// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MarkerRecord> _$markerRecordSerializer =
    new _$MarkerRecordSerializer();

class _$MarkerRecordSerializer implements StructuredSerializer<MarkerRecord> {
  @override
  final Iterable<Type> types = const [MarkerRecord, _$MarkerRecord];
  @override
  final String wireName = 'MarkerRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MarkerRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MarkerRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MarkerRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MarkerRecord extends MarkerRecord {
  @override
  final String? name;
  @override
  final LatLng? location;
  @override
  final String? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MarkerRecord([void Function(MarkerRecordBuilder)? updates]) =>
      (new MarkerRecordBuilder()..update(updates))._build();

  _$MarkerRecord._({this.name, this.location, this.user, this.ffRef})
      : super._();

  @override
  MarkerRecord rebuild(void Function(MarkerRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MarkerRecordBuilder toBuilder() => new MarkerRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MarkerRecord &&
        name == other.name &&
        location == other.location &&
        user == other.user &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), location.hashCode), user.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MarkerRecord')
          ..add('name', name)
          ..add('location', location)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MarkerRecordBuilder
    implements Builder<MarkerRecord, MarkerRecordBuilder> {
  _$MarkerRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MarkerRecordBuilder() {
    MarkerRecord._initializeBuilder(this);
  }

  MarkerRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MarkerRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MarkerRecord;
  }

  @override
  void update(void Function(MarkerRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MarkerRecord build() => _build();

  _$MarkerRecord _build() {
    final _$result = _$v ??
        new _$MarkerRecord._(
            name: name, location: location, user: user, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
