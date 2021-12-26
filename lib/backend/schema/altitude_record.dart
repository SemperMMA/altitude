import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'altitude_record.g.dart';

abstract class AltitudeRecord
    implements Built<AltitudeRecord, AltitudeRecordBuilder> {
  static Serializer<AltitudeRecord> get serializer =>
      _$altitudeRecordSerializer;

  @nullable
  String get image;

  @nullable
  String get title;

  @nullable
  String get activity;

  @nullable
  String get hours;

  @nullable
  String get division;

  @nullable
  String get type;

  @nullable
  String get access;

  @nullable
  String get content;

  @nullable
  bool get featured;

  @nullable
  String get location;

  @nullable
  LatLng get map;

  @nullable
  String get snippet;

  @nullable
  String get url;

  @nullable
  DateTime get date;

  @nullable
  String get status;

  @nullable
  String get phone;

  @nullable
  String get sunday;

  @nullable
  String get monday;

  @nullable
  String get tuesday;

  @nullable
  String get wednesday;

  @nullable
  String get thursday;

  @nullable
  String get friday;

  @nullable
  String get saturday;

  @nullable
  String get holiday;

  @nullable
  String get email;

  @nullable
  String get tagOne;

  @nullable
  String get tagTwo;

  @nullable
  String get tagThree;

  @nullable
  String get tag;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AltitudeRecordBuilder builder) => builder
    ..image = ''
    ..title = ''
    ..activity = ''
    ..hours = ''
    ..division = ''
    ..type = ''
    ..access = ''
    ..content = ''
    ..featured = false
    ..location = ''
    ..snippet = ''
    ..url = ''
    ..status = ''
    ..phone = ''
    ..sunday = ''
    ..monday = ''
    ..tuesday = ''
    ..wednesday = ''
    ..thursday = ''
    ..friday = ''
    ..saturday = ''
    ..holiday = ''
    ..email = ''
    ..tagOne = ''
    ..tagTwo = ''
    ..tagThree = ''
    ..tag = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('altitude');

  static Stream<AltitudeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static AltitudeRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AltitudeRecord(
        (c) => c
          ..image = snapshot.data['image']
          ..title = snapshot.data['title']
          ..activity = snapshot.data['activity']
          ..hours = snapshot.data['hours']
          ..division = snapshot.data['division']
          ..type = snapshot.data['type']
          ..access = snapshot.data['access']
          ..content = snapshot.data['content']
          ..featured = snapshot.data['featured']
          ..location = snapshot.data['location']
          ..map = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..snippet = snapshot.data['snippet']
          ..url = snapshot.data['url']
          ..date = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['date']))
          ..status = snapshot.data['status']
          ..phone = snapshot.data['phone']
          ..sunday = snapshot.data['sunday']
          ..monday = snapshot.data['monday']
          ..tuesday = snapshot.data['tuesday']
          ..wednesday = snapshot.data['wednesday']
          ..thursday = snapshot.data['thursday']
          ..friday = snapshot.data['friday']
          ..saturday = snapshot.data['saturday']
          ..holiday = snapshot.data['holiday']
          ..email = snapshot.data['email']
          ..tagOne = snapshot.data['tagOne']
          ..tagTwo = snapshot.data['tagTwo']
          ..tagThree = snapshot.data['tagThree']
          ..tag = snapshot.data['tag']
          ..reference = AltitudeRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AltitudeRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'altitude',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AltitudeRecord._();
  factory AltitudeRecord([void Function(AltitudeRecordBuilder) updates]) =
      _$AltitudeRecord;

  static AltitudeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAltitudeRecordData({
  String image,
  String title,
  String activity,
  String hours,
  String division,
  String type,
  String access,
  String content,
  bool featured,
  String location,
  LatLng map,
  String snippet,
  String url,
  DateTime date,
  String status,
  String phone,
  String sunday,
  String monday,
  String tuesday,
  String wednesday,
  String thursday,
  String friday,
  String saturday,
  String holiday,
  String email,
  String tagOne,
  String tagTwo,
  String tagThree,
  String tag,
}) =>
    serializers.toFirestore(
        AltitudeRecord.serializer,
        AltitudeRecord((a) => a
          ..image = image
          ..title = title
          ..activity = activity
          ..hours = hours
          ..division = division
          ..type = type
          ..access = access
          ..content = content
          ..featured = featured
          ..location = location
          ..map = map
          ..snippet = snippet
          ..url = url
          ..date = date
          ..status = status
          ..phone = phone
          ..sunday = sunday
          ..monday = monday
          ..tuesday = tuesday
          ..wednesday = wednesday
          ..thursday = thursday
          ..friday = friday
          ..saturday = saturday
          ..holiday = holiday
          ..email = email
          ..tagOne = tagOne
          ..tagTwo = tagTwo
          ..tagThree = tagThree
          ..tag = tag));
