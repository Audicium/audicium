// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audiobook.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAudioBookCollection on Isar {
  IsarCollection<AudioBook> get audioBooks => this.collection();
}

const AudioBookSchema = CollectionSchema(
  name: r'AudioBook',
  id: -2977668482942161942,
  properties: {
    r'author': PropertySchema(
      id: 0,
      name: r'author',
      type: IsarType.string,
    ),
    r'bookUris': PropertySchema(
      id: 1,
      name: r'bookUris',
      type: IsarType.objectList,
      target: r'AudioInfo',
    ),
    r'bookUrl': PropertySchema(
      id: 2,
      name: r'bookUrl',
      type: IsarType.string,
    ),
    r'coverImage': PropertySchema(
      id: 3,
      name: r'coverImage',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'durationInSeconds': PropertySchema(
      id: 5,
      name: r'durationInSeconds',
      type: IsarType.long,
    ),
    r'genre': PropertySchema(
      id: 6,
      name: r'genre',
      type: IsarType.stringList,
    ),
    r'progress': PropertySchema(
      id: 7,
      name: r'progress',
      type: IsarType.long,
    ),
    r'timeStamps': PropertySchema(
      id: 8,
      name: r'timeStamps',
      type: IsarType.objectList,
      target: r'TimeStamps',
    ),
    r'title': PropertySchema(
      id: 9,
      name: r'title',
      type: IsarType.string,
    ),
    r'uploadDate': PropertySchema(
      id: 10,
      name: r'uploadDate',
      type: IsarType.dateTime,
    ),
    r'uploader': PropertySchema(
      id: 11,
      name: r'uploader',
      type: IsarType.string,
    )
  },
  estimateSize: _audioBookEstimateSize,
  serialize: _audioBookSerialize,
  deserialize: _audioBookDeserialize,
  deserializeProp: _audioBookDeserializeProp,
  idName: r'videoHash',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'AudioInfo': AudioInfoSchema,
    r'TimeStamps': TimeStampsSchema
  },
  getId: _audioBookGetId,
  getLinks: _audioBookGetLinks,
  attach: _audioBookAttach,
  version: '3.1.0+1',
);

int _audioBookEstimateSize(
  AudioBook object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.author;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.bookUris.length * 3;
  {
    final offsets = allOffsets[AudioInfo]!;
    for (var i = 0; i < object.bookUris.length; i++) {
      final value = object.bookUris[i];
      bytesCount += AudioInfoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.bookUrl.length * 3;
  {
    final value = object.coverImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.genre;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.timeStamps;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[TimeStamps]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              TimeStampsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.title.length * 3;
  {
    final value = object.uploader;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _audioBookSerialize(
  AudioBook object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.author);
  writer.writeObjectList<AudioInfo>(
    offsets[1],
    allOffsets,
    AudioInfoSchema.serialize,
    object.bookUris,
  );
  writer.writeString(offsets[2], object.bookUrl);
  writer.writeString(offsets[3], object.coverImage);
  writer.writeString(offsets[4], object.description);
  writer.writeLong(offsets[5], object.durationInSeconds);
  writer.writeStringList(offsets[6], object.genre);
  writer.writeLong(offsets[7], object.progress);
  writer.writeObjectList<TimeStamps>(
    offsets[8],
    allOffsets,
    TimeStampsSchema.serialize,
    object.timeStamps,
  );
  writer.writeString(offsets[9], object.title);
  writer.writeDateTime(offsets[10], object.uploadDate);
  writer.writeString(offsets[11], object.uploader);
}

AudioBook _audioBookDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AudioBook(
    author: reader.readStringOrNull(offsets[0]),
    bookUris: reader.readObjectList<AudioInfo>(
          offsets[1],
          AudioInfoSchema.deserialize,
          allOffsets,
          AudioInfo(),
        ) ??
        [],
    bookUrl: reader.readString(offsets[2]),
    coverImage: reader.readStringOrNull(offsets[3]),
    description: reader.readStringOrNull(offsets[4]),
    durationInSeconds: reader.readLongOrNull(offsets[5]),
    genre: reader.readStringList(offsets[6]),
    progress: reader.readLongOrNull(offsets[7]) ?? 0,
    timeStamps: reader.readObjectList<TimeStamps>(
      offsets[8],
      TimeStampsSchema.deserialize,
      allOffsets,
      TimeStamps(),
    ),
    title: reader.readString(offsets[9]),
    uploadDate: reader.readDateTimeOrNull(offsets[10]),
    uploader: reader.readStringOrNull(offsets[11]),
  );
  return object;
}

P _audioBookDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<AudioInfo>(
            offset,
            AudioInfoSchema.deserialize,
            allOffsets,
            AudioInfo(),
          ) ??
          []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 8:
      return (reader.readObjectList<TimeStamps>(
        offset,
        TimeStampsSchema.deserialize,
        allOffsets,
        TimeStamps(),
      )) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _audioBookGetId(AudioBook object) {
  return object.videoHash;
}

List<IsarLinkBase<dynamic>> _audioBookGetLinks(AudioBook object) {
  return [];
}

void _audioBookAttach(IsarCollection<dynamic> col, Id id, AudioBook object) {}

extension AudioBookQueryWhereSort
    on QueryBuilder<AudioBook, AudioBook, QWhere> {
  QueryBuilder<AudioBook, AudioBook, QAfterWhere> anyVideoHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AudioBookQueryWhere
    on QueryBuilder<AudioBook, AudioBook, QWhereClause> {
  QueryBuilder<AudioBook, AudioBook, QAfterWhereClause> videoHashEqualTo(
      Id videoHash) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: videoHash,
        upper: videoHash,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterWhereClause> videoHashNotEqualTo(
      Id videoHash) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: videoHash, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: videoHash, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: videoHash, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: videoHash, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterWhereClause> videoHashGreaterThan(
      Id videoHash,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: videoHash, includeLower: include),
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterWhereClause> videoHashLessThan(
      Id videoHash,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: videoHash, includeUpper: include),
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterWhereClause> videoHashBetween(
    Id lowerVideoHash,
    Id upperVideoHash, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerVideoHash,
        includeLower: includeLower,
        upper: upperVideoHash,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AudioBookQueryFilter
    on QueryBuilder<AudioBook, AudioBook, QFilterCondition> {
  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      bookUrisLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookUris',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookUris',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      bookUrisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookUris',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      bookUrisLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookUris',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      bookUrisLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookUris',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      bookUrisLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bookUris',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      bookUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> coverImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverImage',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      coverImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coverImage',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> coverImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      coverImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> coverImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> coverImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      coverImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> coverImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> coverImageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> coverImageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      coverImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverImage',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      coverImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverImage',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      durationInSecondsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      durationInSecondsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationInSeconds',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      durationInSecondsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      durationInSecondsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      durationInSecondsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      durationInSecondsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genre',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genre',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genre',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genre',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genre',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genre',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      genreLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genre',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> genreLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genre',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> progressEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progress',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> progressGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progress',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> progressLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progress',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> progressBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> timeStampsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeStamps',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      timeStampsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeStamps',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      timeStampsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeStamps',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      timeStampsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeStamps',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      timeStampsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeStamps',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      timeStampsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeStamps',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      timeStampsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeStamps',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      timeStampsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'timeStamps',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploadDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploadDate',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      uploadDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploadDate',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploadDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      uploadDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uploadDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploadDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uploadDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploadDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uploadDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploader',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      uploaderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploader',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uploader',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uploader',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uploader',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> uploaderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploader',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      uploaderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uploader',
        value: '',
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> videoHashEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'videoHash',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition>
      videoHashGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'videoHash',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> videoHashLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'videoHash',
        value: value,
      ));
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> videoHashBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'videoHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AudioBookQueryObject
    on QueryBuilder<AudioBook, AudioBook, QFilterCondition> {
  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> bookUrisElement(
      FilterQuery<AudioInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'bookUris');
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterFilterCondition> timeStampsElement(
      FilterQuery<TimeStamps> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'timeStamps');
    });
  }
}

extension AudioBookQueryLinks
    on QueryBuilder<AudioBook, AudioBook, QFilterCondition> {}

extension AudioBookQuerySortBy on QueryBuilder<AudioBook, AudioBook, QSortBy> {
  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByBookUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookUrl', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByBookUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookUrl', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByCoverImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByCoverImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy>
      sortByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByUploadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadDate', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByUploadDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadDate', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByUploader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> sortByUploaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.desc);
    });
  }
}

extension AudioBookQuerySortThenBy
    on QueryBuilder<AudioBook, AudioBook, QSortThenBy> {
  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByBookUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookUrl', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByBookUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookUrl', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByCoverImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByCoverImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImage', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy>
      thenByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByUploadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadDate', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByUploadDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadDate', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByUploader() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByUploaderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploader', Sort.desc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByVideoHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoHash', Sort.asc);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QAfterSortBy> thenByVideoHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'videoHash', Sort.desc);
    });
  }
}

extension AudioBookQueryWhereDistinct
    on QueryBuilder<AudioBook, AudioBook, QDistinct> {
  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByBookUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByCoverImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverImage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInSeconds');
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre');
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByUploadDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadDate');
    });
  }

  QueryBuilder<AudioBook, AudioBook, QDistinct> distinctByUploader(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploader', caseSensitive: caseSensitive);
    });
  }
}

extension AudioBookQueryProperty
    on QueryBuilder<AudioBook, AudioBook, QQueryProperty> {
  QueryBuilder<AudioBook, int, QQueryOperations> videoHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'videoHash');
    });
  }

  QueryBuilder<AudioBook, String?, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<AudioBook, List<AudioInfo>, QQueryOperations>
      bookUrisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookUris');
    });
  }

  QueryBuilder<AudioBook, String, QQueryOperations> bookUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookUrl');
    });
  }

  QueryBuilder<AudioBook, String?, QQueryOperations> coverImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverImage');
    });
  }

  QueryBuilder<AudioBook, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<AudioBook, int?, QQueryOperations> durationInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInSeconds');
    });
  }

  QueryBuilder<AudioBook, List<String>?, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<AudioBook, int, QQueryOperations> progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<AudioBook, List<TimeStamps>?, QQueryOperations>
      timeStampsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeStamps');
    });
  }

  QueryBuilder<AudioBook, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<AudioBook, DateTime?, QQueryOperations> uploadDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadDate');
    });
  }

  QueryBuilder<AudioBook, String?, QQueryOperations> uploaderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploader');
    });
  }
}
