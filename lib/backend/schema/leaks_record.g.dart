// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LeaksRecord> _$leaksRecordSerializer = new _$LeaksRecordSerializer();

class _$LeaksRecordSerializer implements StructuredSerializer<LeaksRecord> {
  @override
  final Iterable<Type> types = const [LeaksRecord, _$LeaksRecord];
  @override
  final String wireName = 'LeaksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LeaksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.reportedBy;
    if (value != null) {
      result
        ..add('reportedBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  LeaksRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LeaksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'reportedBy':
          result.reportedBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$LeaksRecord extends LeaksRecord {
  @override
  final LatLng? location;
  @override
  final DocumentReference<Object?>? reportedBy;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LeaksRecord([void Function(LeaksRecordBuilder)? updates]) =>
      (new LeaksRecordBuilder()..update(updates))._build();

  _$LeaksRecord._({this.location, this.reportedBy, this.createdAt, this.ffRef})
      : super._();

  @override
  LeaksRecord rebuild(void Function(LeaksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LeaksRecordBuilder toBuilder() => new LeaksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LeaksRecord &&
        location == other.location &&
        reportedBy == other.reportedBy &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, reportedBy.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LeaksRecord')
          ..add('location', location)
          ..add('reportedBy', reportedBy)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LeaksRecordBuilder implements Builder<LeaksRecord, LeaksRecordBuilder> {
  _$LeaksRecord? _$v;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DocumentReference<Object?>? _reportedBy;
  DocumentReference<Object?>? get reportedBy => _$this._reportedBy;
  set reportedBy(DocumentReference<Object?>? reportedBy) =>
      _$this._reportedBy = reportedBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LeaksRecordBuilder() {
    LeaksRecord._initializeBuilder(this);
  }

  LeaksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location;
      _reportedBy = $v.reportedBy;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LeaksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LeaksRecord;
  }

  @override
  void update(void Function(LeaksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LeaksRecord build() => _build();

  _$LeaksRecord _build() {
    final _$result = _$v ??
        new _$LeaksRecord._(
            location: location,
            reportedBy: reportedBy,
            createdAt: createdAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
