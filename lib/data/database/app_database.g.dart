// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EditorsTable extends Editors with TableInfo<$EditorsTable, Editor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EditorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, description, icon, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'editors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Editor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Editor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Editor(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
    );
  }

  @override
  $EditorsTable createAlias(String alias) {
    return $EditorsTable(attachedDatabase, alias);
  }
}

class Editor extends DataClass implements Insertable<Editor> {
  final int id;
  final String title;
  final String description;
  final String icon;
  final String image;
  const Editor({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['icon'] = Variable<String>(icon);
    map['image'] = Variable<String>(image);
    return map;
  }

  EditorsCompanion toCompanion(bool nullToAbsent) {
    return EditorsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      icon: Value(icon),
      image: Value(image),
    );
  }

  factory Editor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Editor(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      icon: serializer.fromJson<String>(json['icon']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<String>(icon),
      'image': serializer.toJson<String>(image),
    };
  }

  Editor copyWith({
    int? id,
    String? title,
    String? description,
    String? icon,
    String? image,
  }) => Editor(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    icon: icon ?? this.icon,
    image: image ?? this.image,
  );
  Editor copyWithCompanion(EditorsCompanion data) {
    return Editor(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      icon: data.icon.present ? data.icon.value : this.icon,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Editor(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, icon, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Editor &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.image == this.image);
}

class EditorsCompanion extends UpdateCompanion<Editor> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> icon;
  final Value<String> image;
  const EditorsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.image = const Value.absent(),
  });
  EditorsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String icon,
    required String image,
  }) : title = Value(title),
       description = Value(description),
       icon = Value(icon),
       image = Value(image);
  static Insertable<Editor> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (image != null) 'image': image,
    });
  }

  EditorsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? icon,
    Value<String>? image,
  }) {
    return EditorsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EditorsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EditorsTable editors = $EditorsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [editors];
}

typedef $$EditorsTableCreateCompanionBuilder =
    EditorsCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required String icon,
      required String image,
    });
typedef $$EditorsTableUpdateCompanionBuilder =
    EditorsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> icon,
      Value<String> image,
    });

class $$EditorsTableFilterComposer
    extends Composer<_$AppDatabase, $EditorsTable> {
  $$EditorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EditorsTableOrderingComposer
    extends Composer<_$AppDatabase, $EditorsTable> {
  $$EditorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EditorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EditorsTable> {
  $$EditorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);
}

class $$EditorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EditorsTable,
          Editor,
          $$EditorsTableFilterComposer,
          $$EditorsTableOrderingComposer,
          $$EditorsTableAnnotationComposer,
          $$EditorsTableCreateCompanionBuilder,
          $$EditorsTableUpdateCompanionBuilder,
          (Editor, BaseReferences<_$AppDatabase, $EditorsTable, Editor>),
          Editor,
          PrefetchHooks Function()
        > {
  $$EditorsTableTableManager(_$AppDatabase db, $EditorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EditorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EditorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EditorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<String> image = const Value.absent(),
              }) => EditorsCompanion(
                id: id,
                title: title,
                description: description,
                icon: icon,
                image: image,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required String icon,
                required String image,
              }) => EditorsCompanion.insert(
                id: id,
                title: title,
                description: description,
                icon: icon,
                image: image,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EditorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EditorsTable,
      Editor,
      $$EditorsTableFilterComposer,
      $$EditorsTableOrderingComposer,
      $$EditorsTableAnnotationComposer,
      $$EditorsTableCreateCompanionBuilder,
      $$EditorsTableUpdateCompanionBuilder,
      (Editor, BaseReferences<_$AppDatabase, $EditorsTable, Editor>),
      Editor,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EditorsTableTableManager get editors =>
      $$EditorsTableTableManager(_db, _db.editors);
}
