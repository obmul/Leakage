import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'leaks_record.g.dart';

abstract class LeaksRecord implements Built<LeaksRecord, LeaksRecordBuilder> {
  static Serializer<LeaksRecord> get serializer => _$leaksRecordSerializer;

  LatLng? get location;

  DocumentReference? get reportedBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LeaksRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Leaks');

  static Stream<LeaksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LeaksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LeaksRecord._();
  factory LeaksRecord([void Function(LeaksRecordBuilder) updates]) =
      _$LeaksRecord;

  static LeaksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLeaksRecordData({
  LatLng? location,
  DocumentReference? reportedBy,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    LeaksRecord.serializer,
    LeaksRecord(
      (l) => l
        ..location = location
        ..reportedBy = reportedBy
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
