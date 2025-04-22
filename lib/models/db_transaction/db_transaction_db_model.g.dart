// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_transaction_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDbTransactionDBModelCollection on Isar {
  IsarCollection<DbTransactionDBModel> get dbTransactionDBModels =>
      this.collection();
}

const DbTransactionDBModelSchema = CollectionSchema(
  name: r'DbTransactionDBModel',
  id: 7292597520401303708,
  properties: {
    r'transactionDate': PropertySchema(
      id: 0,
      name: r'transactionDate',
      type: IsarType.string,
    ),
    r'transactionName': PropertySchema(
      id: 1,
      name: r'transactionName',
      type: IsarType.string,
    )
  },
  estimateSize: _dbTransactionDBModelEstimateSize,
  serialize: _dbTransactionDBModelSerialize,
  deserialize: _dbTransactionDBModelDeserialize,
  deserializeProp: _dbTransactionDBModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dbTransactionDBModelGetId,
  getLinks: _dbTransactionDBModelGetLinks,
  attach: _dbTransactionDBModelAttach,
  version: '3.1.0+1',
);

int _dbTransactionDBModelEstimateSize(
  DbTransactionDBModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.transactionDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transactionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dbTransactionDBModelSerialize(
  DbTransactionDBModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.transactionDate);
  writer.writeString(offsets[1], object.transactionName);
}

DbTransactionDBModel _dbTransactionDBModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DbTransactionDBModel(
    transactionDate: reader.readStringOrNull(offsets[0]),
    transactionName: reader.readStringOrNull(offsets[1]),
  );
  object.id = id;
  return object;
}

P _dbTransactionDBModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dbTransactionDBModelGetId(DbTransactionDBModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dbTransactionDBModelGetLinks(
    DbTransactionDBModel object) {
  return [];
}

void _dbTransactionDBModelAttach(
    IsarCollection<dynamic> col, Id id, DbTransactionDBModel object) {
  object.id = id;
}

extension DbTransactionDBModelQueryWhereSort
    on QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QWhere> {
  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DbTransactionDBModelQueryWhere
    on QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QWhereClause> {
  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DbTransactionDBModelQueryFilter on QueryBuilder<DbTransactionDBModel,
    DbTransactionDBModel, QFilterCondition> {
  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionDate',
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
          QAfterFilterCondition>
      transactionDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
          QAfterFilterCondition>
      transactionDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDate',
        value: '',
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionDate',
        value: '',
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionName',
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionName',
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
          QAfterFilterCondition>
      transactionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
          QAfterFilterCondition>
      transactionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionName',
        value: '',
      ));
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel,
      QAfterFilterCondition> transactionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionName',
        value: '',
      ));
    });
  }
}

extension DbTransactionDBModelQueryObject on QueryBuilder<DbTransactionDBModel,
    DbTransactionDBModel, QFilterCondition> {}

extension DbTransactionDBModelQueryLinks on QueryBuilder<DbTransactionDBModel,
    DbTransactionDBModel, QFilterCondition> {}

extension DbTransactionDBModelQuerySortBy
    on QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QSortBy> {
  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      sortByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      sortByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      sortByTransactionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionName', Sort.asc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      sortByTransactionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionName', Sort.desc);
    });
  }
}

extension DbTransactionDBModelQuerySortThenBy
    on QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QSortThenBy> {
  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      thenByTransactionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.asc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      thenByTransactionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDate', Sort.desc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      thenByTransactionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionName', Sort.asc);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QAfterSortBy>
      thenByTransactionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionName', Sort.desc);
    });
  }
}

extension DbTransactionDBModelQueryWhereDistinct
    on QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QDistinct> {
  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QDistinct>
      distinctByTransactionDate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DbTransactionDBModel, DbTransactionDBModel, QDistinct>
      distinctByTransactionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionName',
          caseSensitive: caseSensitive);
    });
  }
}

extension DbTransactionDBModelQueryProperty on QueryBuilder<
    DbTransactionDBModel, DbTransactionDBModel, QQueryProperty> {
  QueryBuilder<DbTransactionDBModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DbTransactionDBModel, String?, QQueryOperations>
      transactionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDate');
    });
  }

  QueryBuilder<DbTransactionDBModel, String?, QQueryOperations>
      transactionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionName');
    });
  }
}
