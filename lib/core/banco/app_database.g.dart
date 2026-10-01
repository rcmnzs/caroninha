// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PassageirosTable extends Passageiros
    with TableInfo<$PassageirosTable, Passageiro> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PassageirosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> atualizadoEm = GeneratedColumn<DateTime>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _excluidoMeta = const VerificationMeta(
    'excluido',
  );
  @override
  late final GeneratedColumn<bool> excluido = GeneratedColumn<bool>(
    'excluido',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("excluido" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _telefoneMeta = const VerificationMeta(
    'telefone',
  );
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
    'telefone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    nome,
    telefone,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'passageiros';
  @override
  VerificationContext validateIntegrity(
    Insertable<Passageiro> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    }
    if (data.containsKey('excluido')) {
      context.handle(
        _excluidoMeta,
        excluido.isAcceptableOrUnknown(data['excluido']!, _excluidoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('telefone')) {
      context.handle(
        _telefoneMeta,
        telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Passageiro map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Passageiro(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}atualizado_em'],
      )!,
      excluido: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}excluido'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      telefone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefone'],
      ),
    );
  }

  @override
  $PassageirosTable createAlias(String alias) {
    return $PassageirosTable(attachedDatabase, alias);
  }
}

class Passageiro extends DataClass implements Insertable<Passageiro> {
  final String id;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;
  final String nome;
  final String? telefone;
  const Passageiro({
    required this.id,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    required this.nome,
    this.telefone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['usuario_id'] = Variable<String>(usuarioId);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    map['atualizado_em'] = Variable<DateTime>(atualizadoEm);
    map['excluido'] = Variable<bool>(excluido);
    map['sincronizado'] = Variable<bool>(sincronizado);
    map['nome'] = Variable<String>(nome);
    if (!nullToAbsent || telefone != null) {
      map['telefone'] = Variable<String>(telefone);
    }
    return map;
  }

  PassageirosCompanion toCompanion(bool nullToAbsent) {
    return PassageirosCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      criadoEm: Value(criadoEm),
      atualizadoEm: Value(atualizadoEm),
      excluido: Value(excluido),
      sincronizado: Value(sincronizado),
      nome: Value(nome),
      telefone: telefone == null && nullToAbsent
          ? const Value.absent()
          : Value(telefone),
    );
  }

  factory Passageiro.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Passageiro(
      id: serializer.fromJson<String>(json['id']),
      usuarioId: serializer.fromJson<String>(json['usuarioId']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
      atualizadoEm: serializer.fromJson<DateTime>(json['atualizadoEm']),
      excluido: serializer.fromJson<bool>(json['excluido']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
      nome: serializer.fromJson<String>(json['nome']),
      telefone: serializer.fromJson<String?>(json['telefone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'usuarioId': serializer.toJson<String>(usuarioId),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
      'atualizadoEm': serializer.toJson<DateTime>(atualizadoEm),
      'excluido': serializer.toJson<bool>(excluido),
      'sincronizado': serializer.toJson<bool>(sincronizado),
      'nome': serializer.toJson<String>(nome),
      'telefone': serializer.toJson<String?>(telefone),
    };
  }

  Passageiro copyWith({
    String? id,
    String? usuarioId,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
    bool? excluido,
    bool? sincronizado,
    String? nome,
    Value<String?> telefone = const Value.absent(),
  }) => Passageiro(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    criadoEm: criadoEm ?? this.criadoEm,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    excluido: excluido ?? this.excluido,
    sincronizado: sincronizado ?? this.sincronizado,
    nome: nome ?? this.nome,
    telefone: telefone.present ? telefone.value : this.telefone,
  );
  Passageiro copyWithCompanion(PassageirosCompanion data) {
    return Passageiro(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      excluido: data.excluido.present ? data.excluido.value : this.excluido,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
      nome: data.nome.present ? data.nome.value : this.nome,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Passageiro(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('nome: $nome, ')
          ..write('telefone: $telefone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    nome,
    telefone,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Passageiro &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.criadoEm == this.criadoEm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.excluido == this.excluido &&
          other.sincronizado == this.sincronizado &&
          other.nome == this.nome &&
          other.telefone == this.telefone);
}

class PassageirosCompanion extends UpdateCompanion<Passageiro> {
  final Value<String> id;
  final Value<String> usuarioId;
  final Value<DateTime> criadoEm;
  final Value<DateTime> atualizadoEm;
  final Value<bool> excluido;
  final Value<bool> sincronizado;
  final Value<String> nome;
  final Value<String?> telefone;
  final Value<int> rowid;
  const PassageirosCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.nome = const Value.absent(),
    this.telefone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PassageirosCompanion.insert({
    required String id,
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    required String nome,
    this.telefone = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       nome = Value(nome);
  static Insertable<Passageiro> custom({
    Expression<String>? id,
    Expression<String>? usuarioId,
    Expression<DateTime>? criadoEm,
    Expression<DateTime>? atualizadoEm,
    Expression<bool>? excluido,
    Expression<bool>? sincronizado,
    Expression<String>? nome,
    Expression<String>? telefone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (excluido != null) 'excluido': excluido,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (nome != null) 'nome': nome,
      if (telefone != null) 'telefone': telefone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PassageirosCompanion copyWith({
    Value<String>? id,
    Value<String>? usuarioId,
    Value<DateTime>? criadoEm,
    Value<DateTime>? atualizadoEm,
    Value<bool>? excluido,
    Value<bool>? sincronizado,
    Value<String>? nome,
    Value<String?>? telefone,
    Value<int>? rowid,
  }) {
    return PassageirosCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      excluido: excluido ?? this.excluido,
      sincronizado: sincronizado ?? this.sincronizado,
      nome: nome ?? this.nome,
      telefone: telefone ?? this.telefone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<String>(usuarioId.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<DateTime>(atualizadoEm.value);
    }
    if (excluido.present) {
      map['excluido'] = Variable<bool>(excluido.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PassageirosCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('nome: $nome, ')
          ..write('telefone: $telefone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CaronasTable extends Caronas with TableInfo<$CaronasTable, Carona> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CaronasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> atualizadoEm = GeneratedColumn<DateTime>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _excluidoMeta = const VerificationMeta(
    'excluido',
  );
  @override
  late final GeneratedColumn<bool> excluido = GeneratedColumn<bool>(
    'excluido',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("excluido" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _passageiroIdMeta = const VerificationMeta(
    'passageiroId',
  );
  @override
  late final GeneratedColumn<String> passageiroId = GeneratedColumn<String>(
    'passageiro_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES passageiros (id)',
    ),
  );
  static const VerificationMeta _valorCentavosMeta = const VerificationMeta(
    'valorCentavos',
  );
  @override
  late final GeneratedColumn<int> valorCentavos = GeneratedColumn<int>(
    'valor_centavos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime> data = GeneratedColumn<DateTime>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pagoMeta = const VerificationMeta('pago');
  @override
  late final GeneratedColumn<bool> pago = GeneratedColumn<bool>(
    'pago',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pago" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _origemMeta = const VerificationMeta('origem');
  @override
  late final GeneratedColumn<String> origem = GeneratedColumn<String>(
    'origem',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _destinoMeta = const VerificationMeta(
    'destino',
  );
  @override
  late final GeneratedColumn<String> destino = GeneratedColumn<String>(
    'destino',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _observacaoMeta = const VerificationMeta(
    'observacao',
  );
  @override
  late final GeneratedColumn<String> observacao = GeneratedColumn<String>(
    'observacao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    passageiroId,
    valorCentavos,
    data,
    pago,
    origem,
    destino,
    observacao,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'caronas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Carona> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    }
    if (data.containsKey('excluido')) {
      context.handle(
        _excluidoMeta,
        excluido.isAcceptableOrUnknown(data['excluido']!, _excluidoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    if (data.containsKey('passageiro_id')) {
      context.handle(
        _passageiroIdMeta,
        passageiroId.isAcceptableOrUnknown(
          data['passageiro_id']!,
          _passageiroIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passageiroIdMeta);
    }
    if (data.containsKey('valor_centavos')) {
      context.handle(
        _valorCentavosMeta,
        valorCentavos.isAcceptableOrUnknown(
          data['valor_centavos']!,
          _valorCentavosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorCentavosMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('pago')) {
      context.handle(
        _pagoMeta,
        pago.isAcceptableOrUnknown(data['pago']!, _pagoMeta),
      );
    }
    if (data.containsKey('origem')) {
      context.handle(
        _origemMeta,
        origem.isAcceptableOrUnknown(data['origem']!, _origemMeta),
      );
    }
    if (data.containsKey('destino')) {
      context.handle(
        _destinoMeta,
        destino.isAcceptableOrUnknown(data['destino']!, _destinoMeta),
      );
    }
    if (data.containsKey('observacao')) {
      context.handle(
        _observacaoMeta,
        observacao.isAcceptableOrUnknown(data['observacao']!, _observacaoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Carona map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Carona(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}atualizado_em'],
      )!,
      excluido: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}excluido'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      passageiroId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}passageiro_id'],
      )!,
      valorCentavos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}valor_centavos'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data'],
      )!,
      pago: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pago'],
      )!,
      origem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origem'],
      ),
      destino: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destino'],
      ),
      observacao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observacao'],
      ),
    );
  }

  @override
  $CaronasTable createAlias(String alias) {
    return $CaronasTable(attachedDatabase, alias);
  }
}

class Carona extends DataClass implements Insertable<Carona> {
  final String id;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;
  final String passageiroId;
  final int valorCentavos;
  final DateTime data;
  final bool pago;
  final String? origem;
  final String? destino;
  final String? observacao;
  const Carona({
    required this.id,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    required this.passageiroId,
    required this.valorCentavos,
    required this.data,
    required this.pago,
    this.origem,
    this.destino,
    this.observacao,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['usuario_id'] = Variable<String>(usuarioId);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    map['atualizado_em'] = Variable<DateTime>(atualizadoEm);
    map['excluido'] = Variable<bool>(excluido);
    map['sincronizado'] = Variable<bool>(sincronizado);
    map['passageiro_id'] = Variable<String>(passageiroId);
    map['valor_centavos'] = Variable<int>(valorCentavos);
    map['data'] = Variable<DateTime>(data);
    map['pago'] = Variable<bool>(pago);
    if (!nullToAbsent || origem != null) {
      map['origem'] = Variable<String>(origem);
    }
    if (!nullToAbsent || destino != null) {
      map['destino'] = Variable<String>(destino);
    }
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String>(observacao);
    }
    return map;
  }

  CaronasCompanion toCompanion(bool nullToAbsent) {
    return CaronasCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      criadoEm: Value(criadoEm),
      atualizadoEm: Value(atualizadoEm),
      excluido: Value(excluido),
      sincronizado: Value(sincronizado),
      passageiroId: Value(passageiroId),
      valorCentavos: Value(valorCentavos),
      data: Value(data),
      pago: Value(pago),
      origem: origem == null && nullToAbsent
          ? const Value.absent()
          : Value(origem),
      destino: destino == null && nullToAbsent
          ? const Value.absent()
          : Value(destino),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
    );
  }

  factory Carona.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Carona(
      id: serializer.fromJson<String>(json['id']),
      usuarioId: serializer.fromJson<String>(json['usuarioId']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
      atualizadoEm: serializer.fromJson<DateTime>(json['atualizadoEm']),
      excluido: serializer.fromJson<bool>(json['excluido']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
      passageiroId: serializer.fromJson<String>(json['passageiroId']),
      valorCentavos: serializer.fromJson<int>(json['valorCentavos']),
      data: serializer.fromJson<DateTime>(json['data']),
      pago: serializer.fromJson<bool>(json['pago']),
      origem: serializer.fromJson<String?>(json['origem']),
      destino: serializer.fromJson<String?>(json['destino']),
      observacao: serializer.fromJson<String?>(json['observacao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'usuarioId': serializer.toJson<String>(usuarioId),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
      'atualizadoEm': serializer.toJson<DateTime>(atualizadoEm),
      'excluido': serializer.toJson<bool>(excluido),
      'sincronizado': serializer.toJson<bool>(sincronizado),
      'passageiroId': serializer.toJson<String>(passageiroId),
      'valorCentavos': serializer.toJson<int>(valorCentavos),
      'data': serializer.toJson<DateTime>(data),
      'pago': serializer.toJson<bool>(pago),
      'origem': serializer.toJson<String?>(origem),
      'destino': serializer.toJson<String?>(destino),
      'observacao': serializer.toJson<String?>(observacao),
    };
  }

  Carona copyWith({
    String? id,
    String? usuarioId,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
    bool? excluido,
    bool? sincronizado,
    String? passageiroId,
    int? valorCentavos,
    DateTime? data,
    bool? pago,
    Value<String?> origem = const Value.absent(),
    Value<String?> destino = const Value.absent(),
    Value<String?> observacao = const Value.absent(),
  }) => Carona(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    criadoEm: criadoEm ?? this.criadoEm,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    excluido: excluido ?? this.excluido,
    sincronizado: sincronizado ?? this.sincronizado,
    passageiroId: passageiroId ?? this.passageiroId,
    valorCentavos: valorCentavos ?? this.valorCentavos,
    data: data ?? this.data,
    pago: pago ?? this.pago,
    origem: origem.present ? origem.value : this.origem,
    destino: destino.present ? destino.value : this.destino,
    observacao: observacao.present ? observacao.value : this.observacao,
  );
  Carona copyWithCompanion(CaronasCompanion data) {
    return Carona(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      excluido: data.excluido.present ? data.excluido.value : this.excluido,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
      passageiroId: data.passageiroId.present
          ? data.passageiroId.value
          : this.passageiroId,
      valorCentavos: data.valorCentavos.present
          ? data.valorCentavos.value
          : this.valorCentavos,
      data: data.data.present ? data.data.value : this.data,
      pago: data.pago.present ? data.pago.value : this.pago,
      origem: data.origem.present ? data.origem.value : this.origem,
      destino: data.destino.present ? data.destino.value : this.destino,
      observacao: data.observacao.present
          ? data.observacao.value
          : this.observacao,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Carona(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('passageiroId: $passageiroId, ')
          ..write('valorCentavos: $valorCentavos, ')
          ..write('data: $data, ')
          ..write('pago: $pago, ')
          ..write('origem: $origem, ')
          ..write('destino: $destino, ')
          ..write('observacao: $observacao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    passageiroId,
    valorCentavos,
    data,
    pago,
    origem,
    destino,
    observacao,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Carona &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.criadoEm == this.criadoEm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.excluido == this.excluido &&
          other.sincronizado == this.sincronizado &&
          other.passageiroId == this.passageiroId &&
          other.valorCentavos == this.valorCentavos &&
          other.data == this.data &&
          other.pago == this.pago &&
          other.origem == this.origem &&
          other.destino == this.destino &&
          other.observacao == this.observacao);
}

class CaronasCompanion extends UpdateCompanion<Carona> {
  final Value<String> id;
  final Value<String> usuarioId;
  final Value<DateTime> criadoEm;
  final Value<DateTime> atualizadoEm;
  final Value<bool> excluido;
  final Value<bool> sincronizado;
  final Value<String> passageiroId;
  final Value<int> valorCentavos;
  final Value<DateTime> data;
  final Value<bool> pago;
  final Value<String?> origem;
  final Value<String?> destino;
  final Value<String?> observacao;
  final Value<int> rowid;
  const CaronasCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.passageiroId = const Value.absent(),
    this.valorCentavos = const Value.absent(),
    this.data = const Value.absent(),
    this.pago = const Value.absent(),
    this.origem = const Value.absent(),
    this.destino = const Value.absent(),
    this.observacao = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CaronasCompanion.insert({
    required String id,
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    required String passageiroId,
    required int valorCentavos,
    required DateTime data,
    this.pago = const Value.absent(),
    this.origem = const Value.absent(),
    this.destino = const Value.absent(),
    this.observacao = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       passageiroId = Value(passageiroId),
       valorCentavos = Value(valorCentavos),
       data = Value(data);
  static Insertable<Carona> custom({
    Expression<String>? id,
    Expression<String>? usuarioId,
    Expression<DateTime>? criadoEm,
    Expression<DateTime>? atualizadoEm,
    Expression<bool>? excluido,
    Expression<bool>? sincronizado,
    Expression<String>? passageiroId,
    Expression<int>? valorCentavos,
    Expression<DateTime>? data,
    Expression<bool>? pago,
    Expression<String>? origem,
    Expression<String>? destino,
    Expression<String>? observacao,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (excluido != null) 'excluido': excluido,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (passageiroId != null) 'passageiro_id': passageiroId,
      if (valorCentavos != null) 'valor_centavos': valorCentavos,
      if (data != null) 'data': data,
      if (pago != null) 'pago': pago,
      if (origem != null) 'origem': origem,
      if (destino != null) 'destino': destino,
      if (observacao != null) 'observacao': observacao,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CaronasCompanion copyWith({
    Value<String>? id,
    Value<String>? usuarioId,
    Value<DateTime>? criadoEm,
    Value<DateTime>? atualizadoEm,
    Value<bool>? excluido,
    Value<bool>? sincronizado,
    Value<String>? passageiroId,
    Value<int>? valorCentavos,
    Value<DateTime>? data,
    Value<bool>? pago,
    Value<String?>? origem,
    Value<String?>? destino,
    Value<String?>? observacao,
    Value<int>? rowid,
  }) {
    return CaronasCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      excluido: excluido ?? this.excluido,
      sincronizado: sincronizado ?? this.sincronizado,
      passageiroId: passageiroId ?? this.passageiroId,
      valorCentavos: valorCentavos ?? this.valorCentavos,
      data: data ?? this.data,
      pago: pago ?? this.pago,
      origem: origem ?? this.origem,
      destino: destino ?? this.destino,
      observacao: observacao ?? this.observacao,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<String>(usuarioId.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<DateTime>(atualizadoEm.value);
    }
    if (excluido.present) {
      map['excluido'] = Variable<bool>(excluido.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (passageiroId.present) {
      map['passageiro_id'] = Variable<String>(passageiroId.value);
    }
    if (valorCentavos.present) {
      map['valor_centavos'] = Variable<int>(valorCentavos.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (pago.present) {
      map['pago'] = Variable<bool>(pago.value);
    }
    if (origem.present) {
      map['origem'] = Variable<String>(origem.value);
    }
    if (destino.present) {
      map['destino'] = Variable<String>(destino.value);
    }
    if (observacao.present) {
      map['observacao'] = Variable<String>(observacao.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CaronasCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('passageiroId: $passageiroId, ')
          ..write('valorCentavos: $valorCentavos, ')
          ..write('data: $data, ')
          ..write('pago: $pago, ')
          ..write('origem: $origem, ')
          ..write('destino: $destino, ')
          ..write('observacao: $observacao, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TransacoesTable extends Transacoes
    with TableInfo<$TransacoesTable, Transacoe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransacoesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> atualizadoEm = GeneratedColumn<DateTime>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _excluidoMeta = const VerificationMeta(
    'excluido',
  );
  @override
  late final GeneratedColumn<bool> excluido = GeneratedColumn<bool>(
    'excluido',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("excluido" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TipoTransacao, String> tipo =
      GeneratedColumn<String>(
        'tipo',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TipoTransacao>($TransacoesTable.$convertertipo);
  @override
  late final GeneratedColumnWithTypeConverter<CategoriaTransacao, String>
  categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<CategoriaTransacao>($TransacoesTable.$convertercategoria);
  static const VerificationMeta _valorCentavosMeta = const VerificationMeta(
    'valorCentavos',
  );
  @override
  late final GeneratedColumn<int> valorCentavos = GeneratedColumn<int>(
    'valor_centavos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime> data = GeneratedColumn<DateTime>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descricaoMeta = const VerificationMeta(
    'descricao',
  );
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
    'descricao',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caronaIdMeta = const VerificationMeta(
    'caronaId',
  );
  @override
  late final GeneratedColumn<String> caronaId = GeneratedColumn<String>(
    'carona_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES caronas (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    tipo,
    categoria,
    valorCentavos,
    data,
    descricao,
    caronaId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transacoes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Transacoe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    }
    if (data.containsKey('excluido')) {
      context.handle(
        _excluidoMeta,
        excluido.isAcceptableOrUnknown(data['excluido']!, _excluidoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    if (data.containsKey('valor_centavos')) {
      context.handle(
        _valorCentavosMeta,
        valorCentavos.isAcceptableOrUnknown(
          data['valor_centavos']!,
          _valorCentavosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorCentavosMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(
        _descricaoMeta,
        descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta),
      );
    }
    if (data.containsKey('carona_id')) {
      context.handle(
        _caronaIdMeta,
        caronaId.isAcceptableOrUnknown(data['carona_id']!, _caronaIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transacoe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transacoe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}atualizado_em'],
      )!,
      excluido: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}excluido'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      tipo: $TransacoesTable.$convertertipo.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tipo'],
        )!,
      ),
      categoria: $TransacoesTable.$convertercategoria.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}categoria'],
        )!,
      ),
      valorCentavos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}valor_centavos'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data'],
      )!,
      descricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descricao'],
      ),
      caronaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}carona_id'],
      ),
    );
  }

  @override
  $TransacoesTable createAlias(String alias) {
    return $TransacoesTable(attachedDatabase, alias);
  }

  static TypeConverter<TipoTransacao, String> $convertertipo =
      const TipoTransacaoConverter();
  static TypeConverter<CategoriaTransacao, String> $convertercategoria =
      const CategoriaTransacaoConverter();
}

class Transacoe extends DataClass implements Insertable<Transacoe> {
  final String id;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;
  final TipoTransacao tipo;
  final CategoriaTransacao categoria;
  final int valorCentavos;
  final DateTime data;
  final String? descricao;
  final String? caronaId;
  const Transacoe({
    required this.id,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    required this.tipo,
    required this.categoria,
    required this.valorCentavos,
    required this.data,
    this.descricao,
    this.caronaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['usuario_id'] = Variable<String>(usuarioId);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    map['atualizado_em'] = Variable<DateTime>(atualizadoEm);
    map['excluido'] = Variable<bool>(excluido);
    map['sincronizado'] = Variable<bool>(sincronizado);
    {
      map['tipo'] = Variable<String>(
        $TransacoesTable.$convertertipo.toSql(tipo),
      );
    }
    {
      map['categoria'] = Variable<String>(
        $TransacoesTable.$convertercategoria.toSql(categoria),
      );
    }
    map['valor_centavos'] = Variable<int>(valorCentavos);
    map['data'] = Variable<DateTime>(data);
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    if (!nullToAbsent || caronaId != null) {
      map['carona_id'] = Variable<String>(caronaId);
    }
    return map;
  }

  TransacoesCompanion toCompanion(bool nullToAbsent) {
    return TransacoesCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      criadoEm: Value(criadoEm),
      atualizadoEm: Value(atualizadoEm),
      excluido: Value(excluido),
      sincronizado: Value(sincronizado),
      tipo: Value(tipo),
      categoria: Value(categoria),
      valorCentavos: Value(valorCentavos),
      data: Value(data),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      caronaId: caronaId == null && nullToAbsent
          ? const Value.absent()
          : Value(caronaId),
    );
  }

  factory Transacoe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transacoe(
      id: serializer.fromJson<String>(json['id']),
      usuarioId: serializer.fromJson<String>(json['usuarioId']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
      atualizadoEm: serializer.fromJson<DateTime>(json['atualizadoEm']),
      excluido: serializer.fromJson<bool>(json['excluido']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
      tipo: serializer.fromJson<TipoTransacao>(json['tipo']),
      categoria: serializer.fromJson<CategoriaTransacao>(json['categoria']),
      valorCentavos: serializer.fromJson<int>(json['valorCentavos']),
      data: serializer.fromJson<DateTime>(json['data']),
      descricao: serializer.fromJson<String?>(json['descricao']),
      caronaId: serializer.fromJson<String?>(json['caronaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'usuarioId': serializer.toJson<String>(usuarioId),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
      'atualizadoEm': serializer.toJson<DateTime>(atualizadoEm),
      'excluido': serializer.toJson<bool>(excluido),
      'sincronizado': serializer.toJson<bool>(sincronizado),
      'tipo': serializer.toJson<TipoTransacao>(tipo),
      'categoria': serializer.toJson<CategoriaTransacao>(categoria),
      'valorCentavos': serializer.toJson<int>(valorCentavos),
      'data': serializer.toJson<DateTime>(data),
      'descricao': serializer.toJson<String?>(descricao),
      'caronaId': serializer.toJson<String?>(caronaId),
    };
  }

  Transacoe copyWith({
    String? id,
    String? usuarioId,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
    bool? excluido,
    bool? sincronizado,
    TipoTransacao? tipo,
    CategoriaTransacao? categoria,
    int? valorCentavos,
    DateTime? data,
    Value<String?> descricao = const Value.absent(),
    Value<String?> caronaId = const Value.absent(),
  }) => Transacoe(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    criadoEm: criadoEm ?? this.criadoEm,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    excluido: excluido ?? this.excluido,
    sincronizado: sincronizado ?? this.sincronizado,
    tipo: tipo ?? this.tipo,
    categoria: categoria ?? this.categoria,
    valorCentavos: valorCentavos ?? this.valorCentavos,
    data: data ?? this.data,
    descricao: descricao.present ? descricao.value : this.descricao,
    caronaId: caronaId.present ? caronaId.value : this.caronaId,
  );
  Transacoe copyWithCompanion(TransacoesCompanion data) {
    return Transacoe(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      excluido: data.excluido.present ? data.excluido.value : this.excluido,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      valorCentavos: data.valorCentavos.present
          ? data.valorCentavos.value
          : this.valorCentavos,
      data: data.data.present ? data.data.value : this.data,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      caronaId: data.caronaId.present ? data.caronaId.value : this.caronaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transacoe(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('tipo: $tipo, ')
          ..write('categoria: $categoria, ')
          ..write('valorCentavos: $valorCentavos, ')
          ..write('data: $data, ')
          ..write('descricao: $descricao, ')
          ..write('caronaId: $caronaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    tipo,
    categoria,
    valorCentavos,
    data,
    descricao,
    caronaId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transacoe &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.criadoEm == this.criadoEm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.excluido == this.excluido &&
          other.sincronizado == this.sincronizado &&
          other.tipo == this.tipo &&
          other.categoria == this.categoria &&
          other.valorCentavos == this.valorCentavos &&
          other.data == this.data &&
          other.descricao == this.descricao &&
          other.caronaId == this.caronaId);
}

class TransacoesCompanion extends UpdateCompanion<Transacoe> {
  final Value<String> id;
  final Value<String> usuarioId;
  final Value<DateTime> criadoEm;
  final Value<DateTime> atualizadoEm;
  final Value<bool> excluido;
  final Value<bool> sincronizado;
  final Value<TipoTransacao> tipo;
  final Value<CategoriaTransacao> categoria;
  final Value<int> valorCentavos;
  final Value<DateTime> data;
  final Value<String?> descricao;
  final Value<String?> caronaId;
  final Value<int> rowid;
  const TransacoesCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.tipo = const Value.absent(),
    this.categoria = const Value.absent(),
    this.valorCentavos = const Value.absent(),
    this.data = const Value.absent(),
    this.descricao = const Value.absent(),
    this.caronaId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransacoesCompanion.insert({
    required String id,
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    required TipoTransacao tipo,
    required CategoriaTransacao categoria,
    required int valorCentavos,
    required DateTime data,
    this.descricao = const Value.absent(),
    this.caronaId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       tipo = Value(tipo),
       categoria = Value(categoria),
       valorCentavos = Value(valorCentavos),
       data = Value(data);
  static Insertable<Transacoe> custom({
    Expression<String>? id,
    Expression<String>? usuarioId,
    Expression<DateTime>? criadoEm,
    Expression<DateTime>? atualizadoEm,
    Expression<bool>? excluido,
    Expression<bool>? sincronizado,
    Expression<String>? tipo,
    Expression<String>? categoria,
    Expression<int>? valorCentavos,
    Expression<DateTime>? data,
    Expression<String>? descricao,
    Expression<String>? caronaId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (excluido != null) 'excluido': excluido,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (tipo != null) 'tipo': tipo,
      if (categoria != null) 'categoria': categoria,
      if (valorCentavos != null) 'valor_centavos': valorCentavos,
      if (data != null) 'data': data,
      if (descricao != null) 'descricao': descricao,
      if (caronaId != null) 'carona_id': caronaId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransacoesCompanion copyWith({
    Value<String>? id,
    Value<String>? usuarioId,
    Value<DateTime>? criadoEm,
    Value<DateTime>? atualizadoEm,
    Value<bool>? excluido,
    Value<bool>? sincronizado,
    Value<TipoTransacao>? tipo,
    Value<CategoriaTransacao>? categoria,
    Value<int>? valorCentavos,
    Value<DateTime>? data,
    Value<String?>? descricao,
    Value<String?>? caronaId,
    Value<int>? rowid,
  }) {
    return TransacoesCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      excluido: excluido ?? this.excluido,
      sincronizado: sincronizado ?? this.sincronizado,
      tipo: tipo ?? this.tipo,
      categoria: categoria ?? this.categoria,
      valorCentavos: valorCentavos ?? this.valorCentavos,
      data: data ?? this.data,
      descricao: descricao ?? this.descricao,
      caronaId: caronaId ?? this.caronaId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<String>(usuarioId.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<DateTime>(atualizadoEm.value);
    }
    if (excluido.present) {
      map['excluido'] = Variable<bool>(excluido.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(
        $TransacoesTable.$convertertipo.toSql(tipo.value),
      );
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(
        $TransacoesTable.$convertercategoria.toSql(categoria.value),
      );
    }
    if (valorCentavos.present) {
      map['valor_centavos'] = Variable<int>(valorCentavos.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (caronaId.present) {
      map['carona_id'] = Variable<String>(caronaId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransacoesCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('tipo: $tipo, ')
          ..write('categoria: $categoria, ')
          ..write('valorCentavos: $valorCentavos, ')
          ..write('data: $data, ')
          ..write('descricao: $descricao, ')
          ..write('caronaId: $caronaId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AbastecimentosTable extends Abastecimentos
    with TableInfo<$AbastecimentosTable, Abastecimento> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AbastecimentosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> atualizadoEm = GeneratedColumn<DateTime>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _excluidoMeta = const VerificationMeta(
    'excluido',
  );
  @override
  late final GeneratedColumn<bool> excluido = GeneratedColumn<bool>(
    'excluido',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("excluido" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime> data = GeneratedColumn<DateTime>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _litrosMeta = const VerificationMeta('litros');
  @override
  late final GeneratedColumn<double> litros = GeneratedColumn<double>(
    'litros',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precoLitroCentavosMeta =
      const VerificationMeta('precoLitroCentavos');
  @override
  late final GeneratedColumn<int> precoLitroCentavos = GeneratedColumn<int>(
    'preco_litro_centavos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorTotalCentavosMeta =
      const VerificationMeta('valorTotalCentavos');
  @override
  late final GeneratedColumn<int> valorTotalCentavos = GeneratedColumn<int>(
    'valor_total_centavos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kmOdometroMeta = const VerificationMeta(
    'kmOdometro',
  );
  @override
  late final GeneratedColumn<int> kmOdometro = GeneratedColumn<int>(
    'km_odometro',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transacaoIdMeta = const VerificationMeta(
    'transacaoId',
  );
  @override
  late final GeneratedColumn<String> transacaoId = GeneratedColumn<String>(
    'transacao_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES transacoes (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    data,
    litros,
    precoLitroCentavos,
    valorTotalCentavos,
    kmOdometro,
    transacaoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'abastecimentos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Abastecimento> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    }
    if (data.containsKey('excluido')) {
      context.handle(
        _excluidoMeta,
        excluido.isAcceptableOrUnknown(data['excluido']!, _excluidoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('litros')) {
      context.handle(
        _litrosMeta,
        litros.isAcceptableOrUnknown(data['litros']!, _litrosMeta),
      );
    } else if (isInserting) {
      context.missing(_litrosMeta);
    }
    if (data.containsKey('preco_litro_centavos')) {
      context.handle(
        _precoLitroCentavosMeta,
        precoLitroCentavos.isAcceptableOrUnknown(
          data['preco_litro_centavos']!,
          _precoLitroCentavosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precoLitroCentavosMeta);
    }
    if (data.containsKey('valor_total_centavos')) {
      context.handle(
        _valorTotalCentavosMeta,
        valorTotalCentavos.isAcceptableOrUnknown(
          data['valor_total_centavos']!,
          _valorTotalCentavosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorTotalCentavosMeta);
    }
    if (data.containsKey('km_odometro')) {
      context.handle(
        _kmOdometroMeta,
        kmOdometro.isAcceptableOrUnknown(data['km_odometro']!, _kmOdometroMeta),
      );
    } else if (isInserting) {
      context.missing(_kmOdometroMeta);
    }
    if (data.containsKey('transacao_id')) {
      context.handle(
        _transacaoIdMeta,
        transacaoId.isAcceptableOrUnknown(
          data['transacao_id']!,
          _transacaoIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Abastecimento map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Abastecimento(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}atualizado_em'],
      )!,
      excluido: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}excluido'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data'],
      )!,
      litros: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}litros'],
      )!,
      precoLitroCentavos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}preco_litro_centavos'],
      )!,
      valorTotalCentavos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}valor_total_centavos'],
      )!,
      kmOdometro: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}km_odometro'],
      )!,
      transacaoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transacao_id'],
      ),
    );
  }

  @override
  $AbastecimentosTable createAlias(String alias) {
    return $AbastecimentosTable(attachedDatabase, alias);
  }
}

class Abastecimento extends DataClass implements Insertable<Abastecimento> {
  final String id;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;
  final DateTime data;
  final double litros;
  final int precoLitroCentavos;
  final int valorTotalCentavos;
  final int kmOdometro;
  final String? transacaoId;
  const Abastecimento({
    required this.id,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    required this.data,
    required this.litros,
    required this.precoLitroCentavos,
    required this.valorTotalCentavos,
    required this.kmOdometro,
    this.transacaoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['usuario_id'] = Variable<String>(usuarioId);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    map['atualizado_em'] = Variable<DateTime>(atualizadoEm);
    map['excluido'] = Variable<bool>(excluido);
    map['sincronizado'] = Variable<bool>(sincronizado);
    map['data'] = Variable<DateTime>(data);
    map['litros'] = Variable<double>(litros);
    map['preco_litro_centavos'] = Variable<int>(precoLitroCentavos);
    map['valor_total_centavos'] = Variable<int>(valorTotalCentavos);
    map['km_odometro'] = Variable<int>(kmOdometro);
    if (!nullToAbsent || transacaoId != null) {
      map['transacao_id'] = Variable<String>(transacaoId);
    }
    return map;
  }

  AbastecimentosCompanion toCompanion(bool nullToAbsent) {
    return AbastecimentosCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      criadoEm: Value(criadoEm),
      atualizadoEm: Value(atualizadoEm),
      excluido: Value(excluido),
      sincronizado: Value(sincronizado),
      data: Value(data),
      litros: Value(litros),
      precoLitroCentavos: Value(precoLitroCentavos),
      valorTotalCentavos: Value(valorTotalCentavos),
      kmOdometro: Value(kmOdometro),
      transacaoId: transacaoId == null && nullToAbsent
          ? const Value.absent()
          : Value(transacaoId),
    );
  }

  factory Abastecimento.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Abastecimento(
      id: serializer.fromJson<String>(json['id']),
      usuarioId: serializer.fromJson<String>(json['usuarioId']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
      atualizadoEm: serializer.fromJson<DateTime>(json['atualizadoEm']),
      excluido: serializer.fromJson<bool>(json['excluido']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
      data: serializer.fromJson<DateTime>(json['data']),
      litros: serializer.fromJson<double>(json['litros']),
      precoLitroCentavos: serializer.fromJson<int>(json['precoLitroCentavos']),
      valorTotalCentavos: serializer.fromJson<int>(json['valorTotalCentavos']),
      kmOdometro: serializer.fromJson<int>(json['kmOdometro']),
      transacaoId: serializer.fromJson<String?>(json['transacaoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'usuarioId': serializer.toJson<String>(usuarioId),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
      'atualizadoEm': serializer.toJson<DateTime>(atualizadoEm),
      'excluido': serializer.toJson<bool>(excluido),
      'sincronizado': serializer.toJson<bool>(sincronizado),
      'data': serializer.toJson<DateTime>(data),
      'litros': serializer.toJson<double>(litros),
      'precoLitroCentavos': serializer.toJson<int>(precoLitroCentavos),
      'valorTotalCentavos': serializer.toJson<int>(valorTotalCentavos),
      'kmOdometro': serializer.toJson<int>(kmOdometro),
      'transacaoId': serializer.toJson<String?>(transacaoId),
    };
  }

  Abastecimento copyWith({
    String? id,
    String? usuarioId,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
    bool? excluido,
    bool? sincronizado,
    DateTime? data,
    double? litros,
    int? precoLitroCentavos,
    int? valorTotalCentavos,
    int? kmOdometro,
    Value<String?> transacaoId = const Value.absent(),
  }) => Abastecimento(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    criadoEm: criadoEm ?? this.criadoEm,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    excluido: excluido ?? this.excluido,
    sincronizado: sincronizado ?? this.sincronizado,
    data: data ?? this.data,
    litros: litros ?? this.litros,
    precoLitroCentavos: precoLitroCentavos ?? this.precoLitroCentavos,
    valorTotalCentavos: valorTotalCentavos ?? this.valorTotalCentavos,
    kmOdometro: kmOdometro ?? this.kmOdometro,
    transacaoId: transacaoId.present ? transacaoId.value : this.transacaoId,
  );
  Abastecimento copyWithCompanion(AbastecimentosCompanion data) {
    return Abastecimento(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      excluido: data.excluido.present ? data.excluido.value : this.excluido,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
      data: data.data.present ? data.data.value : this.data,
      litros: data.litros.present ? data.litros.value : this.litros,
      precoLitroCentavos: data.precoLitroCentavos.present
          ? data.precoLitroCentavos.value
          : this.precoLitroCentavos,
      valorTotalCentavos: data.valorTotalCentavos.present
          ? data.valorTotalCentavos.value
          : this.valorTotalCentavos,
      kmOdometro: data.kmOdometro.present
          ? data.kmOdometro.value
          : this.kmOdometro,
      transacaoId: data.transacaoId.present
          ? data.transacaoId.value
          : this.transacaoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Abastecimento(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('data: $data, ')
          ..write('litros: $litros, ')
          ..write('precoLitroCentavos: $precoLitroCentavos, ')
          ..write('valorTotalCentavos: $valorTotalCentavos, ')
          ..write('kmOdometro: $kmOdometro, ')
          ..write('transacaoId: $transacaoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    data,
    litros,
    precoLitroCentavos,
    valorTotalCentavos,
    kmOdometro,
    transacaoId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Abastecimento &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.criadoEm == this.criadoEm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.excluido == this.excluido &&
          other.sincronizado == this.sincronizado &&
          other.data == this.data &&
          other.litros == this.litros &&
          other.precoLitroCentavos == this.precoLitroCentavos &&
          other.valorTotalCentavos == this.valorTotalCentavos &&
          other.kmOdometro == this.kmOdometro &&
          other.transacaoId == this.transacaoId);
}

class AbastecimentosCompanion extends UpdateCompanion<Abastecimento> {
  final Value<String> id;
  final Value<String> usuarioId;
  final Value<DateTime> criadoEm;
  final Value<DateTime> atualizadoEm;
  final Value<bool> excluido;
  final Value<bool> sincronizado;
  final Value<DateTime> data;
  final Value<double> litros;
  final Value<int> precoLitroCentavos;
  final Value<int> valorTotalCentavos;
  final Value<int> kmOdometro;
  final Value<String?> transacaoId;
  final Value<int> rowid;
  const AbastecimentosCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.data = const Value.absent(),
    this.litros = const Value.absent(),
    this.precoLitroCentavos = const Value.absent(),
    this.valorTotalCentavos = const Value.absent(),
    this.kmOdometro = const Value.absent(),
    this.transacaoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AbastecimentosCompanion.insert({
    required String id,
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    required DateTime data,
    required double litros,
    required int precoLitroCentavos,
    required int valorTotalCentavos,
    required int kmOdometro,
    this.transacaoId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       data = Value(data),
       litros = Value(litros),
       precoLitroCentavos = Value(precoLitroCentavos),
       valorTotalCentavos = Value(valorTotalCentavos),
       kmOdometro = Value(kmOdometro);
  static Insertable<Abastecimento> custom({
    Expression<String>? id,
    Expression<String>? usuarioId,
    Expression<DateTime>? criadoEm,
    Expression<DateTime>? atualizadoEm,
    Expression<bool>? excluido,
    Expression<bool>? sincronizado,
    Expression<DateTime>? data,
    Expression<double>? litros,
    Expression<int>? precoLitroCentavos,
    Expression<int>? valorTotalCentavos,
    Expression<int>? kmOdometro,
    Expression<String>? transacaoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (excluido != null) 'excluido': excluido,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (data != null) 'data': data,
      if (litros != null) 'litros': litros,
      if (precoLitroCentavos != null)
        'preco_litro_centavos': precoLitroCentavos,
      if (valorTotalCentavos != null)
        'valor_total_centavos': valorTotalCentavos,
      if (kmOdometro != null) 'km_odometro': kmOdometro,
      if (transacaoId != null) 'transacao_id': transacaoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AbastecimentosCompanion copyWith({
    Value<String>? id,
    Value<String>? usuarioId,
    Value<DateTime>? criadoEm,
    Value<DateTime>? atualizadoEm,
    Value<bool>? excluido,
    Value<bool>? sincronizado,
    Value<DateTime>? data,
    Value<double>? litros,
    Value<int>? precoLitroCentavos,
    Value<int>? valorTotalCentavos,
    Value<int>? kmOdometro,
    Value<String?>? transacaoId,
    Value<int>? rowid,
  }) {
    return AbastecimentosCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      excluido: excluido ?? this.excluido,
      sincronizado: sincronizado ?? this.sincronizado,
      data: data ?? this.data,
      litros: litros ?? this.litros,
      precoLitroCentavos: precoLitroCentavos ?? this.precoLitroCentavos,
      valorTotalCentavos: valorTotalCentavos ?? this.valorTotalCentavos,
      kmOdometro: kmOdometro ?? this.kmOdometro,
      transacaoId: transacaoId ?? this.transacaoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<String>(usuarioId.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<DateTime>(atualizadoEm.value);
    }
    if (excluido.present) {
      map['excluido'] = Variable<bool>(excluido.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (litros.present) {
      map['litros'] = Variable<double>(litros.value);
    }
    if (precoLitroCentavos.present) {
      map['preco_litro_centavos'] = Variable<int>(precoLitroCentavos.value);
    }
    if (valorTotalCentavos.present) {
      map['valor_total_centavos'] = Variable<int>(valorTotalCentavos.value);
    }
    if (kmOdometro.present) {
      map['km_odometro'] = Variable<int>(kmOdometro.value);
    }
    if (transacaoId.present) {
      map['transacao_id'] = Variable<String>(transacaoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbastecimentosCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('data: $data, ')
          ..write('litros: $litros, ')
          ..write('precoLitroCentavos: $precoLitroCentavos, ')
          ..write('valorTotalCentavos: $valorTotalCentavos, ')
          ..write('kmOdometro: $kmOdometro, ')
          ..write('transacaoId: $transacaoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConfiguracoesVeiculoTable extends ConfiguracoesVeiculo
    with TableInfo<$ConfiguracoesVeiculoTable, ConfiguracoesVeiculoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfiguracoesVeiculoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<String> usuarioId = GeneratedColumn<String>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _criadoEmMeta = const VerificationMeta(
    'criadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> criadoEm = GeneratedColumn<DateTime>(
    'criado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _atualizadoEmMeta = const VerificationMeta(
    'atualizadoEm',
  );
  @override
  late final GeneratedColumn<DateTime> atualizadoEm = GeneratedColumn<DateTime>(
    'atualizado_em',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _excluidoMeta = const VerificationMeta(
    'excluido',
  );
  @override
  late final GeneratedColumn<bool> excluido = GeneratedColumn<bool>(
    'excluido',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("excluido" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _tipoCombustivelMeta = const VerificationMeta(
    'tipoCombustivel',
  );
  @override
  late final GeneratedColumn<String> tipoCombustivel = GeneratedColumn<String>(
    'tipo_combustivel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _odometroInicialMeta = const VerificationMeta(
    'odometroInicial',
  );
  @override
  late final GeneratedColumn<int> odometroInicial = GeneratedColumn<int>(
    'odometro_inicial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metaConsumoKmlMeta = const VerificationMeta(
    'metaConsumoKml',
  );
  @override
  late final GeneratedColumn<double> metaConsumoKml = GeneratedColumn<double>(
    'meta_consumo_kml',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metaMensalCentavosMeta =
      const VerificationMeta('metaMensalCentavos');
  @override
  late final GeneratedColumn<int> metaMensalCentavos = GeneratedColumn<int>(
    'meta_mensal_centavos',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    tipoCombustivel,
    odometroInicial,
    metaConsumoKml,
    metaMensalCentavos,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'configuracoes_veiculo';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConfiguracoesVeiculoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    }
    if (data.containsKey('criado_em')) {
      context.handle(
        _criadoEmMeta,
        criadoEm.isAcceptableOrUnknown(data['criado_em']!, _criadoEmMeta),
      );
    }
    if (data.containsKey('atualizado_em')) {
      context.handle(
        _atualizadoEmMeta,
        atualizadoEm.isAcceptableOrUnknown(
          data['atualizado_em']!,
          _atualizadoEmMeta,
        ),
      );
    }
    if (data.containsKey('excluido')) {
      context.handle(
        _excluidoMeta,
        excluido.isAcceptableOrUnknown(data['excluido']!, _excluidoMeta),
      );
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    }
    if (data.containsKey('tipo_combustivel')) {
      context.handle(
        _tipoCombustivelMeta,
        tipoCombustivel.isAcceptableOrUnknown(
          data['tipo_combustivel']!,
          _tipoCombustivelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoCombustivelMeta);
    }
    if (data.containsKey('odometro_inicial')) {
      context.handle(
        _odometroInicialMeta,
        odometroInicial.isAcceptableOrUnknown(
          data['odometro_inicial']!,
          _odometroInicialMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_odometroInicialMeta);
    }
    if (data.containsKey('meta_consumo_kml')) {
      context.handle(
        _metaConsumoKmlMeta,
        metaConsumoKml.isAcceptableOrUnknown(
          data['meta_consumo_kml']!,
          _metaConsumoKmlMeta,
        ),
      );
    }
    if (data.containsKey('meta_mensal_centavos')) {
      context.handle(
        _metaMensalCentavosMeta,
        metaMensalCentavos.isAcceptableOrUnknown(
          data['meta_mensal_centavos']!,
          _metaMensalCentavosMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConfiguracoesVeiculoData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfiguracoesVeiculoData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usuario_id'],
      )!,
      criadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}criado_em'],
      )!,
      atualizadoEm: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}atualizado_em'],
      )!,
      excluido: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}excluido'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
      tipoCombustivel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_combustivel'],
      )!,
      odometroInicial: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}odometro_inicial'],
      )!,
      metaConsumoKml: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}meta_consumo_kml'],
      ),
      metaMensalCentavos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meta_mensal_centavos'],
      ),
    );
  }

  @override
  $ConfiguracoesVeiculoTable createAlias(String alias) {
    return $ConfiguracoesVeiculoTable(attachedDatabase, alias);
  }
}

class ConfiguracoesVeiculoData extends DataClass
    implements Insertable<ConfiguracoesVeiculoData> {
  final String id;
  final String usuarioId;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final bool excluido;
  final bool sincronizado;
  final String tipoCombustivel;
  final int odometroInicial;
  final double? metaConsumoKml;
  final int? metaMensalCentavos;
  const ConfiguracoesVeiculoData({
    required this.id,
    required this.usuarioId,
    required this.criadoEm,
    required this.atualizadoEm,
    required this.excluido,
    required this.sincronizado,
    required this.tipoCombustivel,
    required this.odometroInicial,
    this.metaConsumoKml,
    this.metaMensalCentavos,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['usuario_id'] = Variable<String>(usuarioId);
    map['criado_em'] = Variable<DateTime>(criadoEm);
    map['atualizado_em'] = Variable<DateTime>(atualizadoEm);
    map['excluido'] = Variable<bool>(excluido);
    map['sincronizado'] = Variable<bool>(sincronizado);
    map['tipo_combustivel'] = Variable<String>(tipoCombustivel);
    map['odometro_inicial'] = Variable<int>(odometroInicial);
    if (!nullToAbsent || metaConsumoKml != null) {
      map['meta_consumo_kml'] = Variable<double>(metaConsumoKml);
    }
    if (!nullToAbsent || metaMensalCentavos != null) {
      map['meta_mensal_centavos'] = Variable<int>(metaMensalCentavos);
    }
    return map;
  }

  ConfiguracoesVeiculoCompanion toCompanion(bool nullToAbsent) {
    return ConfiguracoesVeiculoCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      criadoEm: Value(criadoEm),
      atualizadoEm: Value(atualizadoEm),
      excluido: Value(excluido),
      sincronizado: Value(sincronizado),
      tipoCombustivel: Value(tipoCombustivel),
      odometroInicial: Value(odometroInicial),
      metaConsumoKml: metaConsumoKml == null && nullToAbsent
          ? const Value.absent()
          : Value(metaConsumoKml),
      metaMensalCentavos: metaMensalCentavos == null && nullToAbsent
          ? const Value.absent()
          : Value(metaMensalCentavos),
    );
  }

  factory ConfiguracoesVeiculoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfiguracoesVeiculoData(
      id: serializer.fromJson<String>(json['id']),
      usuarioId: serializer.fromJson<String>(json['usuarioId']),
      criadoEm: serializer.fromJson<DateTime>(json['criadoEm']),
      atualizadoEm: serializer.fromJson<DateTime>(json['atualizadoEm']),
      excluido: serializer.fromJson<bool>(json['excluido']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
      tipoCombustivel: serializer.fromJson<String>(json['tipoCombustivel']),
      odometroInicial: serializer.fromJson<int>(json['odometroInicial']),
      metaConsumoKml: serializer.fromJson<double?>(json['metaConsumoKml']),
      metaMensalCentavos: serializer.fromJson<int?>(json['metaMensalCentavos']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'usuarioId': serializer.toJson<String>(usuarioId),
      'criadoEm': serializer.toJson<DateTime>(criadoEm),
      'atualizadoEm': serializer.toJson<DateTime>(atualizadoEm),
      'excluido': serializer.toJson<bool>(excluido),
      'sincronizado': serializer.toJson<bool>(sincronizado),
      'tipoCombustivel': serializer.toJson<String>(tipoCombustivel),
      'odometroInicial': serializer.toJson<int>(odometroInicial),
      'metaConsumoKml': serializer.toJson<double?>(metaConsumoKml),
      'metaMensalCentavos': serializer.toJson<int?>(metaMensalCentavos),
    };
  }

  ConfiguracoesVeiculoData copyWith({
    String? id,
    String? usuarioId,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
    bool? excluido,
    bool? sincronizado,
    String? tipoCombustivel,
    int? odometroInicial,
    Value<double?> metaConsumoKml = const Value.absent(),
    Value<int?> metaMensalCentavos = const Value.absent(),
  }) => ConfiguracoesVeiculoData(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    criadoEm: criadoEm ?? this.criadoEm,
    atualizadoEm: atualizadoEm ?? this.atualizadoEm,
    excluido: excluido ?? this.excluido,
    sincronizado: sincronizado ?? this.sincronizado,
    tipoCombustivel: tipoCombustivel ?? this.tipoCombustivel,
    odometroInicial: odometroInicial ?? this.odometroInicial,
    metaConsumoKml: metaConsumoKml.present
        ? metaConsumoKml.value
        : this.metaConsumoKml,
    metaMensalCentavos: metaMensalCentavos.present
        ? metaMensalCentavos.value
        : this.metaMensalCentavos,
  );
  ConfiguracoesVeiculoData copyWithCompanion(
    ConfiguracoesVeiculoCompanion data,
  ) {
    return ConfiguracoesVeiculoData(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      criadoEm: data.criadoEm.present ? data.criadoEm.value : this.criadoEm,
      atualizadoEm: data.atualizadoEm.present
          ? data.atualizadoEm.value
          : this.atualizadoEm,
      excluido: data.excluido.present ? data.excluido.value : this.excluido,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
      tipoCombustivel: data.tipoCombustivel.present
          ? data.tipoCombustivel.value
          : this.tipoCombustivel,
      odometroInicial: data.odometroInicial.present
          ? data.odometroInicial.value
          : this.odometroInicial,
      metaConsumoKml: data.metaConsumoKml.present
          ? data.metaConsumoKml.value
          : this.metaConsumoKml,
      metaMensalCentavos: data.metaMensalCentavos.present
          ? data.metaMensalCentavos.value
          : this.metaMensalCentavos,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConfiguracoesVeiculoData(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('tipoCombustivel: $tipoCombustivel, ')
          ..write('odometroInicial: $odometroInicial, ')
          ..write('metaConsumoKml: $metaConsumoKml, ')
          ..write('metaMensalCentavos: $metaMensalCentavos')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    usuarioId,
    criadoEm,
    atualizadoEm,
    excluido,
    sincronizado,
    tipoCombustivel,
    odometroInicial,
    metaConsumoKml,
    metaMensalCentavos,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfiguracoesVeiculoData &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.criadoEm == this.criadoEm &&
          other.atualizadoEm == this.atualizadoEm &&
          other.excluido == this.excluido &&
          other.sincronizado == this.sincronizado &&
          other.tipoCombustivel == this.tipoCombustivel &&
          other.odometroInicial == this.odometroInicial &&
          other.metaConsumoKml == this.metaConsumoKml &&
          other.metaMensalCentavos == this.metaMensalCentavos);
}

class ConfiguracoesVeiculoCompanion
    extends UpdateCompanion<ConfiguracoesVeiculoData> {
  final Value<String> id;
  final Value<String> usuarioId;
  final Value<DateTime> criadoEm;
  final Value<DateTime> atualizadoEm;
  final Value<bool> excluido;
  final Value<bool> sincronizado;
  final Value<String> tipoCombustivel;
  final Value<int> odometroInicial;
  final Value<double?> metaConsumoKml;
  final Value<int?> metaMensalCentavos;
  final Value<int> rowid;
  const ConfiguracoesVeiculoCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.tipoCombustivel = const Value.absent(),
    this.odometroInicial = const Value.absent(),
    this.metaConsumoKml = const Value.absent(),
    this.metaMensalCentavos = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConfiguracoesVeiculoCompanion.insert({
    required String id,
    this.usuarioId = const Value.absent(),
    this.criadoEm = const Value.absent(),
    this.atualizadoEm = const Value.absent(),
    this.excluido = const Value.absent(),
    this.sincronizado = const Value.absent(),
    required String tipoCombustivel,
    required int odometroInicial,
    this.metaConsumoKml = const Value.absent(),
    this.metaMensalCentavos = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       tipoCombustivel = Value(tipoCombustivel),
       odometroInicial = Value(odometroInicial);
  static Insertable<ConfiguracoesVeiculoData> custom({
    Expression<String>? id,
    Expression<String>? usuarioId,
    Expression<DateTime>? criadoEm,
    Expression<DateTime>? atualizadoEm,
    Expression<bool>? excluido,
    Expression<bool>? sincronizado,
    Expression<String>? tipoCombustivel,
    Expression<int>? odometroInicial,
    Expression<double>? metaConsumoKml,
    Expression<int>? metaMensalCentavos,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (criadoEm != null) 'criado_em': criadoEm,
      if (atualizadoEm != null) 'atualizado_em': atualizadoEm,
      if (excluido != null) 'excluido': excluido,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (tipoCombustivel != null) 'tipo_combustivel': tipoCombustivel,
      if (odometroInicial != null) 'odometro_inicial': odometroInicial,
      if (metaConsumoKml != null) 'meta_consumo_kml': metaConsumoKml,
      if (metaMensalCentavos != null)
        'meta_mensal_centavos': metaMensalCentavos,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConfiguracoesVeiculoCompanion copyWith({
    Value<String>? id,
    Value<String>? usuarioId,
    Value<DateTime>? criadoEm,
    Value<DateTime>? atualizadoEm,
    Value<bool>? excluido,
    Value<bool>? sincronizado,
    Value<String>? tipoCombustivel,
    Value<int>? odometroInicial,
    Value<double?>? metaConsumoKml,
    Value<int?>? metaMensalCentavos,
    Value<int>? rowid,
  }) {
    return ConfiguracoesVeiculoCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      criadoEm: criadoEm ?? this.criadoEm,
      atualizadoEm: atualizadoEm ?? this.atualizadoEm,
      excluido: excluido ?? this.excluido,
      sincronizado: sincronizado ?? this.sincronizado,
      tipoCombustivel: tipoCombustivel ?? this.tipoCombustivel,
      odometroInicial: odometroInicial ?? this.odometroInicial,
      metaConsumoKml: metaConsumoKml ?? this.metaConsumoKml,
      metaMensalCentavos: metaMensalCentavos ?? this.metaMensalCentavos,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<String>(usuarioId.value);
    }
    if (criadoEm.present) {
      map['criado_em'] = Variable<DateTime>(criadoEm.value);
    }
    if (atualizadoEm.present) {
      map['atualizado_em'] = Variable<DateTime>(atualizadoEm.value);
    }
    if (excluido.present) {
      map['excluido'] = Variable<bool>(excluido.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (tipoCombustivel.present) {
      map['tipo_combustivel'] = Variable<String>(tipoCombustivel.value);
    }
    if (odometroInicial.present) {
      map['odometro_inicial'] = Variable<int>(odometroInicial.value);
    }
    if (metaConsumoKml.present) {
      map['meta_consumo_kml'] = Variable<double>(metaConsumoKml.value);
    }
    if (metaMensalCentavos.present) {
      map['meta_mensal_centavos'] = Variable<int>(metaMensalCentavos.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfiguracoesVeiculoCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('criadoEm: $criadoEm, ')
          ..write('atualizadoEm: $atualizadoEm, ')
          ..write('excluido: $excluido, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('tipoCombustivel: $tipoCombustivel, ')
          ..write('odometroInicial: $odometroInicial, ')
          ..write('metaConsumoKml: $metaConsumoKml, ')
          ..write('metaMensalCentavos: $metaMensalCentavos, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PassageirosTable passageiros = $PassageirosTable(this);
  late final $CaronasTable caronas = $CaronasTable(this);
  late final $TransacoesTable transacoes = $TransacoesTable(this);
  late final $AbastecimentosTable abastecimentos = $AbastecimentosTable(this);
  late final $ConfiguracoesVeiculoTable configuracoesVeiculo =
      $ConfiguracoesVeiculoTable(this);
  late final Index idxPassageirosSincronizado = Index(
    'idx_passageiros_sincronizado',
    'CREATE INDEX idx_passageiros_sincronizado ON passageiros (sincronizado)',
  );
  late final Index idxPassageirosAtualizadoEm = Index(
    'idx_passageiros_atualizado_em',
    'CREATE INDEX idx_passageiros_atualizado_em ON passageiros (atualizado_em)',
  );
  late final Index idxCaronasData = Index(
    'idx_caronas_data',
    'CREATE INDEX idx_caronas_data ON caronas (data)',
  );
  late final Index idxCaronasPassageiroId = Index(
    'idx_caronas_passageiro_id',
    'CREATE INDEX idx_caronas_passageiro_id ON caronas (passageiro_id)',
  );
  late final Index idxCaronasPago = Index(
    'idx_caronas_pago',
    'CREATE INDEX idx_caronas_pago ON caronas (pago)',
  );
  late final Index idxCaronasSincronizado = Index(
    'idx_caronas_sincronizado',
    'CREATE INDEX idx_caronas_sincronizado ON caronas (sincronizado)',
  );
  late final Index idxCaronasAtualizadoEm = Index(
    'idx_caronas_atualizado_em',
    'CREATE INDEX idx_caronas_atualizado_em ON caronas (atualizado_em)',
  );
  late final Index idxTransacoesData = Index(
    'idx_transacoes_data',
    'CREATE INDEX idx_transacoes_data ON transacoes (data)',
  );
  late final Index idxTransacoesTipoCategoria = Index(
    'idx_transacoes_tipo_categoria',
    'CREATE INDEX idx_transacoes_tipo_categoria ON transacoes (tipo, categoria)',
  );
  late final Index idxTransacoesSincronizado = Index(
    'idx_transacoes_sincronizado',
    'CREATE INDEX idx_transacoes_sincronizado ON transacoes (sincronizado)',
  );
  late final Index idxTransacoesAtualizadoEm = Index(
    'idx_transacoes_atualizado_em',
    'CREATE INDEX idx_transacoes_atualizado_em ON transacoes (atualizado_em)',
  );
  late final Index idxTransacoesCaronaIdUnique = Index(
    'idx_transacoes_carona_id_unique',
    'CREATE UNIQUE INDEX idx_transacoes_carona_id_unique ON transacoes (carona_id)',
  );
  late final Index idxAbastecimentosSincronizado = Index(
    'idx_abastecimentos_sincronizado',
    'CREATE INDEX idx_abastecimentos_sincronizado ON abastecimentos (sincronizado)',
  );
  late final Index idxAbastecimentosAtualizadoEm = Index(
    'idx_abastecimentos_atualizado_em',
    'CREATE INDEX idx_abastecimentos_atualizado_em ON abastecimentos (atualizado_em)',
  );
  late final Index idxAbastecimentosTransacaoIdUnique = Index(
    'idx_abastecimentos_transacao_id_unique',
    'CREATE UNIQUE INDEX idx_abastecimentos_transacao_id_unique ON abastecimentos (transacao_id)',
  );
  late final Index idxConfiguracoesVeiculoSincronizado = Index(
    'idx_configuracoes_veiculo_sincronizado',
    'CREATE INDEX idx_configuracoes_veiculo_sincronizado ON configuracoes_veiculo (sincronizado)',
  );
  late final Index idxConfiguracoesVeiculoAtualizadoEm = Index(
    'idx_configuracoes_veiculo_atualizado_em',
    'CREATE INDEX idx_configuracoes_veiculo_atualizado_em ON configuracoes_veiculo (atualizado_em)',
  );
  late final Index idxConfiguracoesVeiculoUsuarioIdUnique = Index(
    'idx_configuracoes_veiculo_usuario_id_unique',
    'CREATE UNIQUE INDEX idx_configuracoes_veiculo_usuario_id_unique ON configuracoes_veiculo (usuario_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    passageiros,
    caronas,
    transacoes,
    abastecimentos,
    configuracoesVeiculo,
    idxPassageirosSincronizado,
    idxPassageirosAtualizadoEm,
    idxCaronasData,
    idxCaronasPassageiroId,
    idxCaronasPago,
    idxCaronasSincronizado,
    idxCaronasAtualizadoEm,
    idxTransacoesData,
    idxTransacoesTipoCategoria,
    idxTransacoesSincronizado,
    idxTransacoesAtualizadoEm,
    idxTransacoesCaronaIdUnique,
    idxAbastecimentosSincronizado,
    idxAbastecimentosAtualizadoEm,
    idxAbastecimentosTransacaoIdUnique,
    idxConfiguracoesVeiculoSincronizado,
    idxConfiguracoesVeiculoAtualizadoEm,
    idxConfiguracoesVeiculoUsuarioIdUnique,
  ];
}

typedef $$PassageirosTableCreateCompanionBuilder =
    PassageirosCompanion Function({
      required String id,
      Value<String> usuarioId,
      Value<DateTime> criadoEm,
      Value<DateTime> atualizadoEm,
      Value<bool> excluido,
      Value<bool> sincronizado,
      required String nome,
      Value<String?> telefone,
      Value<int> rowid,
    });
typedef $$PassageirosTableUpdateCompanionBuilder =
    PassageirosCompanion Function({
      Value<String> id,
      Value<String> usuarioId,
      Value<DateTime> criadoEm,
      Value<DateTime> atualizadoEm,
      Value<bool> excluido,
      Value<bool> sincronizado,
      Value<String> nome,
      Value<String?> telefone,
      Value<int> rowid,
    });

final class $$PassageirosTableReferences
    extends BaseReferences<_$AppDatabase, $PassageirosTable, Passageiro> {
  $$PassageirosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CaronasTable, List<Carona>> _caronasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.caronas,
    aliasName: 'passageiros__id__caronas__passageiro_id',
  );

  $$CaronasTableProcessedTableManager get caronasRefs {
    final manager = $$CaronasTableTableManager(
      $_db,
      $_db.caronas,
    ).filter((f) => f.passageiroId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_caronasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PassageirosTableFilterComposer
    extends Composer<_$AppDatabase, $PassageirosTable> {
  $$PassageirosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefone => $composableBuilder(
    column: $table.telefone,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> caronasRefs(
    Expression<bool> Function($$CaronasTableFilterComposer f) f,
  ) {
    final $$CaronasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caronas,
      getReferencedColumn: (t) => t.passageiroId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaronasTableFilterComposer(
            $db: $db,
            $table: $db.caronas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PassageirosTableOrderingComposer
    extends Composer<_$AppDatabase, $PassageirosTable> {
  $$PassageirosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefone => $composableBuilder(
    column: $table.telefone,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PassageirosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PassageirosTable> {
  $$PassageirosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get usuarioId =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  GeneratedColumn<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excluido =>
      $composableBuilder(column: $table.excluido, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get telefone =>
      $composableBuilder(column: $table.telefone, builder: (column) => column);

  Expression<T> caronasRefs<T extends Object>(
    Expression<T> Function($$CaronasTableAnnotationComposer a) f,
  ) {
    final $$CaronasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.caronas,
      getReferencedColumn: (t) => t.passageiroId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaronasTableAnnotationComposer(
            $db: $db,
            $table: $db.caronas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PassageirosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PassageirosTable,
          Passageiro,
          $$PassageirosTableFilterComposer,
          $$PassageirosTableOrderingComposer,
          $$PassageirosTableAnnotationComposer,
          $$PassageirosTableCreateCompanionBuilder,
          $$PassageirosTableUpdateCompanionBuilder,
          (Passageiro, $$PassageirosTableReferences),
          Passageiro,
          PrefetchHooks Function({bool caronasRefs})
        > {
  $$PassageirosTableTableManager(_$AppDatabase db, $PassageirosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PassageirosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PassageirosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PassageirosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<String?> telefone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PassageirosCompanion(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                nome: nome,
                telefone: telefone,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                required String nome,
                Value<String?> telefone = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PassageirosCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                nome: nome,
                telefone: telefone,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PassageirosTable, Passageiro>(table),
                  $$PassageirosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({caronasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (caronasRefs) db.caronas],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (caronasRefs)
                    await $_getPrefetchedData<
                      Passageiro,
                      $PassageirosTable,
                      Carona
                    >(
                      currentTable: table,
                      referencedTable: $$PassageirosTableReferences
                          ._caronasRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PassageirosTableReferences(
                            db,
                            table,
                            p0,
                          ).caronasRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.passageiroId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PassageirosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PassageirosTable,
      Passageiro,
      $$PassageirosTableFilterComposer,
      $$PassageirosTableOrderingComposer,
      $$PassageirosTableAnnotationComposer,
      $$PassageirosTableCreateCompanionBuilder,
      $$PassageirosTableUpdateCompanionBuilder,
      (Passageiro, $$PassageirosTableReferences),
      Passageiro,
      PrefetchHooks Function({bool caronasRefs})
    >;
typedef $$CaronasTableCreateCompanionBuilder = CaronasCompanion Function({
  required String id,
  Value<String> usuarioId,
  Value<DateTime> criadoEm,
  Value<DateTime> atualizadoEm,
  Value<bool> excluido,
  Value<bool> sincronizado,
  required String passageiroId,
  required int valorCentavos,
  required DateTime data,
  Value<bool> pago,
  Value<String?> origem,
  Value<String?> destino,
  Value<String?> observacao,
  Value<int> rowid,
});
typedef $$CaronasTableUpdateCompanionBuilder = CaronasCompanion Function({
  Value<String> id,
  Value<String> usuarioId,
  Value<DateTime> criadoEm,
  Value<DateTime> atualizadoEm,
  Value<bool> excluido,
  Value<bool> sincronizado,
  Value<String> passageiroId,
  Value<int> valorCentavos,
  Value<DateTime> data,
  Value<bool> pago,
  Value<String?> origem,
  Value<String?> destino,
  Value<String?> observacao,
  Value<int> rowid,
});

final class $$CaronasTableReferences
    extends BaseReferences<_$AppDatabase, $CaronasTable, Carona> {
  $$CaronasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PassageirosTable _passageiroIdTable(_$AppDatabase db) =>
      db.passageiros.createAlias('caronas__passageiro_id__passageiros__id');

  $$PassageirosTableProcessedTableManager get passageiroId {
    final $_column = $_itemColumn<String>('passageiro_id')!;

    final manager = $$PassageirosTableTableManager(
      $_db,
      $_db.passageiros,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_passageiroIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TransacoesTable, List<Transacoe>>
  _transacoesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.transacoes,
    aliasName: 'caronas__id__transacoes__carona_id',
  );

  $$TransacoesTableProcessedTableManager get transacoesRefs {
    final manager = $$TransacoesTableTableManager(
      $_db,
      $_db.transacoes,
    ).filter((f) => f.caronaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_transacoesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CaronasTableFilterComposer
    extends Composer<_$AppDatabase, $CaronasTable> {
  $$CaronasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get valorCentavos => $composableBuilder(
    column: $table.valorCentavos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pago => $composableBuilder(
    column: $table.pago,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origem => $composableBuilder(
    column: $table.origem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destino => $composableBuilder(
    column: $table.destino,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnFilters(column),
  );

  $$PassageirosTableFilterComposer get passageiroId {
    final $$PassageirosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.passageiroId,
      referencedTable: $db.passageiros,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PassageirosTableFilterComposer(
            $db: $db,
            $table: $db.passageiros,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> transacoesRefs(
    Expression<bool> Function($$TransacoesTableFilterComposer f) f,
  ) {
    final $$TransacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transacoes,
      getReferencedColumn: (t) => t.caronaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransacoesTableFilterComposer(
            $db: $db,
            $table: $db.transacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CaronasTableOrderingComposer
    extends Composer<_$AppDatabase, $CaronasTable> {
  $$CaronasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get valorCentavos => $composableBuilder(
    column: $table.valorCentavos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pago => $composableBuilder(
    column: $table.pago,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origem => $composableBuilder(
    column: $table.origem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destino => $composableBuilder(
    column: $table.destino,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => ColumnOrderings(column),
  );

  $$PassageirosTableOrderingComposer get passageiroId {
    final $$PassageirosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.passageiroId,
      referencedTable: $db.passageiros,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PassageirosTableOrderingComposer(
            $db: $db,
            $table: $db.passageiros,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CaronasTableAnnotationComposer
    extends Composer<_$AppDatabase, $CaronasTable> {
  $$CaronasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get usuarioId =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  GeneratedColumn<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excluido =>
      $composableBuilder(column: $table.excluido, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<int> get valorCentavos => $composableBuilder(
    column: $table.valorCentavos,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<bool> get pago =>
      $composableBuilder(column: $table.pago, builder: (column) => column);

  GeneratedColumn<String> get origem =>
      $composableBuilder(column: $table.origem, builder: (column) => column);

  GeneratedColumn<String> get destino =>
      $composableBuilder(column: $table.destino, builder: (column) => column);

  GeneratedColumn<String> get observacao => $composableBuilder(
    column: $table.observacao,
    builder: (column) => column,
  );

  $$PassageirosTableAnnotationComposer get passageiroId {
    final $$PassageirosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.passageiroId,
      referencedTable: $db.passageiros,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PassageirosTableAnnotationComposer(
            $db: $db,
            $table: $db.passageiros,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> transacoesRefs<T extends Object>(
    Expression<T> Function($$TransacoesTableAnnotationComposer a) f,
  ) {
    final $$TransacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transacoes,
      getReferencedColumn: (t) => t.caronaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.transacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CaronasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CaronasTable,
          Carona,
          $$CaronasTableFilterComposer,
          $$CaronasTableOrderingComposer,
          $$CaronasTableAnnotationComposer,
          $$CaronasTableCreateCompanionBuilder,
          $$CaronasTableUpdateCompanionBuilder,
          (Carona, $$CaronasTableReferences),
          Carona,
          PrefetchHooks Function({bool passageiroId, bool transacoesRefs})
        > {
  $$CaronasTableTableManager(_$AppDatabase db, $CaronasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CaronasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CaronasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CaronasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<String> passageiroId = const Value.absent(),
                Value<int> valorCentavos = const Value.absent(),
                Value<DateTime> data = const Value.absent(),
                Value<bool> pago = const Value.absent(),
                Value<String?> origem = const Value.absent(),
                Value<String?> destino = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaronasCompanion(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                passageiroId: passageiroId,
                valorCentavos: valorCentavos,
                data: data,
                pago: pago,
                origem: origem,
                destino: destino,
                observacao: observacao,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                required String passageiroId,
                required int valorCentavos,
                required DateTime data,
                Value<bool> pago = const Value.absent(),
                Value<String?> origem = const Value.absent(),
                Value<String?> destino = const Value.absent(),
                Value<String?> observacao = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CaronasCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                passageiroId: passageiroId,
                valorCentavos: valorCentavos,
                data: data,
                pago: pago,
                origem: origem,
                destino: destino,
                observacao: observacao,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CaronasTable, Carona>(table),
                  $$CaronasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({passageiroId = false, transacoesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (transacoesRefs) db.transacoes],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (passageiroId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.passageiroId,
                            referencedTable: $$CaronasTableReferences
                                ._passageiroIdTable(db),
                            referencedColumn: $$CaronasTableReferences
                                ._passageiroIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (transacoesRefs)
                        await $_getPrefetchedData<
                          Carona,
                          $CaronasTable,
                          Transacoe
                        >(
                          currentTable: table,
                          referencedTable: $$CaronasTableReferences
                              ._transacoesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CaronasTableReferences(
                                db,
                                table,
                                p0,
                              ).transacoesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.caronaId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CaronasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CaronasTable,
      Carona,
      $$CaronasTableFilterComposer,
      $$CaronasTableOrderingComposer,
      $$CaronasTableAnnotationComposer,
      $$CaronasTableCreateCompanionBuilder,
      $$CaronasTableUpdateCompanionBuilder,
      (Carona, $$CaronasTableReferences),
      Carona,
      PrefetchHooks Function({bool passageiroId, bool transacoesRefs})
    >;
typedef $$TransacoesTableCreateCompanionBuilder = TransacoesCompanion Function({
  required String id,
  Value<String> usuarioId,
  Value<DateTime> criadoEm,
  Value<DateTime> atualizadoEm,
  Value<bool> excluido,
  Value<bool> sincronizado,
  required TipoTransacao tipo,
  required CategoriaTransacao categoria,
  required int valorCentavos,
  required DateTime data,
  Value<String?> descricao,
  Value<String?> caronaId,
  Value<int> rowid,
});
typedef $$TransacoesTableUpdateCompanionBuilder = TransacoesCompanion Function({
  Value<String> id,
  Value<String> usuarioId,
  Value<DateTime> criadoEm,
  Value<DateTime> atualizadoEm,
  Value<bool> excluido,
  Value<bool> sincronizado,
  Value<TipoTransacao> tipo,
  Value<CategoriaTransacao> categoria,
  Value<int> valorCentavos,
  Value<DateTime> data,
  Value<String?> descricao,
  Value<String?> caronaId,
  Value<int> rowid,
});

final class $$TransacoesTableReferences
    extends BaseReferences<_$AppDatabase, $TransacoesTable, Transacoe> {
  $$TransacoesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CaronasTable _caronaIdTable(_$AppDatabase db) =>
      db.caronas.createAlias('transacoes__carona_id__caronas__id');

  $$CaronasTableProcessedTableManager? get caronaId {
    final $_column = $_itemColumn<String>('carona_id');
    if ($_column == null) return null;
    final manager = $$CaronasTableTableManager(
      $_db,
      $_db.caronas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_caronaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AbastecimentosTable, List<Abastecimento>>
  _abastecimentosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.abastecimentos,
    aliasName: 'transacoes__id__abastecimentos__transacao_id',
  );

  $$AbastecimentosTableProcessedTableManager get abastecimentosRefs {
    final manager = $$AbastecimentosTableTableManager(
      $_db,
      $_db.abastecimentos,
    ).filter((f) => f.transacaoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_abastecimentosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TransacoesTableFilterComposer
    extends Composer<_$AppDatabase, $TransacoesTable> {
  $$TransacoesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TipoTransacao, TipoTransacao, String>
  get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<CategoriaTransacao, CategoriaTransacao, String>
  get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get valorCentavos => $composableBuilder(
    column: $table.valorCentavos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnFilters(column),
  );

  $$CaronasTableFilterComposer get caronaId {
    final $$CaronasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.caronaId,
      referencedTable: $db.caronas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaronasTableFilterComposer(
            $db: $db,
            $table: $db.caronas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> abastecimentosRefs(
    Expression<bool> Function($$AbastecimentosTableFilterComposer f) f,
  ) {
    final $$AbastecimentosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.abastecimentos,
      getReferencedColumn: (t) => t.transacaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbastecimentosTableFilterComposer(
            $db: $db,
            $table: $db.abastecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransacoesTableOrderingComposer
    extends Composer<_$AppDatabase, $TransacoesTable> {
  $$TransacoesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get valorCentavos => $composableBuilder(
    column: $table.valorCentavos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnOrderings(column),
  );

  $$CaronasTableOrderingComposer get caronaId {
    final $$CaronasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.caronaId,
      referencedTable: $db.caronas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaronasTableOrderingComposer(
            $db: $db,
            $table: $db.caronas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TransacoesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransacoesTable> {
  $$TransacoesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get usuarioId =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  GeneratedColumn<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excluido =>
      $composableBuilder(column: $table.excluido, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TipoTransacao, String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CategoriaTransacao, String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<int> get valorCentavos => $composableBuilder(
    column: $table.valorCentavos,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  $$CaronasTableAnnotationComposer get caronaId {
    final $$CaronasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.caronaId,
      referencedTable: $db.caronas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CaronasTableAnnotationComposer(
            $db: $db,
            $table: $db.caronas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> abastecimentosRefs<T extends Object>(
    Expression<T> Function($$AbastecimentosTableAnnotationComposer a) f,
  ) {
    final $$AbastecimentosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.abastecimentos,
      getReferencedColumn: (t) => t.transacaoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbastecimentosTableAnnotationComposer(
            $db: $db,
            $table: $db.abastecimentos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TransacoesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransacoesTable,
          Transacoe,
          $$TransacoesTableFilterComposer,
          $$TransacoesTableOrderingComposer,
          $$TransacoesTableAnnotationComposer,
          $$TransacoesTableCreateCompanionBuilder,
          $$TransacoesTableUpdateCompanionBuilder,
          (Transacoe, $$TransacoesTableReferences),
          Transacoe,
          PrefetchHooks Function({bool caronaId, bool abastecimentosRefs})
        > {
  $$TransacoesTableTableManager(_$AppDatabase db, $TransacoesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransacoesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransacoesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransacoesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<TipoTransacao> tipo = const Value.absent(),
                Value<CategoriaTransacao> categoria = const Value.absent(),
                Value<int> valorCentavos = const Value.absent(),
                Value<DateTime> data = const Value.absent(),
                Value<String?> descricao = const Value.absent(),
                Value<String?> caronaId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransacoesCompanion(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                tipo: tipo,
                categoria: categoria,
                valorCentavos: valorCentavos,
                data: data,
                descricao: descricao,
                caronaId: caronaId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                required TipoTransacao tipo,
                required CategoriaTransacao categoria,
                required int valorCentavos,
                required DateTime data,
                Value<String?> descricao = const Value.absent(),
                Value<String?> caronaId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TransacoesCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                tipo: tipo,
                categoria: categoria,
                valorCentavos: valorCentavos,
                data: data,
                descricao: descricao,
                caronaId: caronaId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransacoesTable, Transacoe>(table),
                  $$TransacoesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({caronaId = false, abastecimentosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (abastecimentosRefs) db.abastecimentos,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (caronaId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.caronaId,
                            referencedTable: $$TransacoesTableReferences
                                ._caronaIdTable(db),
                            referencedColumn: $$TransacoesTableReferences
                                ._caronaIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (abastecimentosRefs)
                        await $_getPrefetchedData<
                          Transacoe,
                          $TransacoesTable,
                          Abastecimento
                        >(
                          currentTable: table,
                          referencedTable: $$TransacoesTableReferences
                              ._abastecimentosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TransacoesTableReferences(
                                db,
                                table,
                                p0,
                              ).abastecimentosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.transacaoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TransacoesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransacoesTable,
      Transacoe,
      $$TransacoesTableFilterComposer,
      $$TransacoesTableOrderingComposer,
      $$TransacoesTableAnnotationComposer,
      $$TransacoesTableCreateCompanionBuilder,
      $$TransacoesTableUpdateCompanionBuilder,
      (Transacoe, $$TransacoesTableReferences),
      Transacoe,
      PrefetchHooks Function({bool caronaId, bool abastecimentosRefs})
    >;
typedef $$AbastecimentosTableCreateCompanionBuilder =
    AbastecimentosCompanion Function({
      required String id,
      Value<String> usuarioId,
      Value<DateTime> criadoEm,
      Value<DateTime> atualizadoEm,
      Value<bool> excluido,
      Value<bool> sincronizado,
      required DateTime data,
      required double litros,
      required int precoLitroCentavos,
      required int valorTotalCentavos,
      required int kmOdometro,
      Value<String?> transacaoId,
      Value<int> rowid,
    });
typedef $$AbastecimentosTableUpdateCompanionBuilder =
    AbastecimentosCompanion Function({
      Value<String> id,
      Value<String> usuarioId,
      Value<DateTime> criadoEm,
      Value<DateTime> atualizadoEm,
      Value<bool> excluido,
      Value<bool> sincronizado,
      Value<DateTime> data,
      Value<double> litros,
      Value<int> precoLitroCentavos,
      Value<int> valorTotalCentavos,
      Value<int> kmOdometro,
      Value<String?> transacaoId,
      Value<int> rowid,
    });

final class $$AbastecimentosTableReferences
    extends BaseReferences<_$AppDatabase, $AbastecimentosTable, Abastecimento> {
  $$AbastecimentosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TransacoesTable _transacaoIdTable(_$AppDatabase db) =>
      db.transacoes.createAlias('abastecimentos__transacao_id__transacoes__id');

  $$TransacoesTableProcessedTableManager? get transacaoId {
    final $_column = $_itemColumn<String>('transacao_id');
    if ($_column == null) return null;
    final manager = $$TransacoesTableTableManager(
      $_db,
      $_db.transacoes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transacaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AbastecimentosTableFilterComposer
    extends Composer<_$AppDatabase, $AbastecimentosTable> {
  $$AbastecimentosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get litros => $composableBuilder(
    column: $table.litros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get precoLitroCentavos => $composableBuilder(
    column: $table.precoLitroCentavos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get valorTotalCentavos => $composableBuilder(
    column: $table.valorTotalCentavos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get kmOdometro => $composableBuilder(
    column: $table.kmOdometro,
    builder: (column) => ColumnFilters(column),
  );

  $$TransacoesTableFilterComposer get transacaoId {
    final $$TransacoesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transacaoId,
      referencedTable: $db.transacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransacoesTableFilterComposer(
            $db: $db,
            $table: $db.transacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AbastecimentosTableOrderingComposer
    extends Composer<_$AppDatabase, $AbastecimentosTable> {
  $$AbastecimentosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get litros => $composableBuilder(
    column: $table.litros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get precoLitroCentavos => $composableBuilder(
    column: $table.precoLitroCentavos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get valorTotalCentavos => $composableBuilder(
    column: $table.valorTotalCentavos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get kmOdometro => $composableBuilder(
    column: $table.kmOdometro,
    builder: (column) => ColumnOrderings(column),
  );

  $$TransacoesTableOrderingComposer get transacaoId {
    final $$TransacoesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transacaoId,
      referencedTable: $db.transacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransacoesTableOrderingComposer(
            $db: $db,
            $table: $db.transacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AbastecimentosTableAnnotationComposer
    extends Composer<_$AppDatabase, $AbastecimentosTable> {
  $$AbastecimentosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get usuarioId =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  GeneratedColumn<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excluido =>
      $composableBuilder(column: $table.excluido, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<double> get litros =>
      $composableBuilder(column: $table.litros, builder: (column) => column);

  GeneratedColumn<int> get precoLitroCentavos => $composableBuilder(
    column: $table.precoLitroCentavos,
    builder: (column) => column,
  );

  GeneratedColumn<int> get valorTotalCentavos => $composableBuilder(
    column: $table.valorTotalCentavos,
    builder: (column) => column,
  );

  GeneratedColumn<int> get kmOdometro => $composableBuilder(
    column: $table.kmOdometro,
    builder: (column) => column,
  );

  $$TransacoesTableAnnotationComposer get transacaoId {
    final $$TransacoesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transacaoId,
      referencedTable: $db.transacoes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TransacoesTableAnnotationComposer(
            $db: $db,
            $table: $db.transacoes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AbastecimentosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AbastecimentosTable,
          Abastecimento,
          $$AbastecimentosTableFilterComposer,
          $$AbastecimentosTableOrderingComposer,
          $$AbastecimentosTableAnnotationComposer,
          $$AbastecimentosTableCreateCompanionBuilder,
          $$AbastecimentosTableUpdateCompanionBuilder,
          (Abastecimento, $$AbastecimentosTableReferences),
          Abastecimento,
          PrefetchHooks Function({bool transacaoId})
        > {
  $$AbastecimentosTableTableManager(
    _$AppDatabase db,
    $AbastecimentosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AbastecimentosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AbastecimentosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AbastecimentosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<DateTime> data = const Value.absent(),
                Value<double> litros = const Value.absent(),
                Value<int> precoLitroCentavos = const Value.absent(),
                Value<int> valorTotalCentavos = const Value.absent(),
                Value<int> kmOdometro = const Value.absent(),
                Value<String?> transacaoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AbastecimentosCompanion(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                data: data,
                litros: litros,
                precoLitroCentavos: precoLitroCentavos,
                valorTotalCentavos: valorTotalCentavos,
                kmOdometro: kmOdometro,
                transacaoId: transacaoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                required DateTime data,
                required double litros,
                required int precoLitroCentavos,
                required int valorTotalCentavos,
                required int kmOdometro,
                Value<String?> transacaoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AbastecimentosCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                data: data,
                litros: litros,
                precoLitroCentavos: precoLitroCentavos,
                valorTotalCentavos: valorTotalCentavos,
                kmOdometro: kmOdometro,
                transacaoId: transacaoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AbastecimentosTable, Abastecimento>(table),
                  $$AbastecimentosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({transacaoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (transacaoId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.transacaoId,
                        referencedTable: $$AbastecimentosTableReferences
                            ._transacaoIdTable(db),
                        referencedColumn: $$AbastecimentosTableReferences
                            ._transacaoIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AbastecimentosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AbastecimentosTable,
      Abastecimento,
      $$AbastecimentosTableFilterComposer,
      $$AbastecimentosTableOrderingComposer,
      $$AbastecimentosTableAnnotationComposer,
      $$AbastecimentosTableCreateCompanionBuilder,
      $$AbastecimentosTableUpdateCompanionBuilder,
      (Abastecimento, $$AbastecimentosTableReferences),
      Abastecimento,
      PrefetchHooks Function({bool transacaoId})
    >;
typedef $$ConfiguracoesVeiculoTableCreateCompanionBuilder =
    ConfiguracoesVeiculoCompanion Function({
      required String id,
      Value<String> usuarioId,
      Value<DateTime> criadoEm,
      Value<DateTime> atualizadoEm,
      Value<bool> excluido,
      Value<bool> sincronizado,
      required String tipoCombustivel,
      required int odometroInicial,
      Value<double?> metaConsumoKml,
      Value<int?> metaMensalCentavos,
      Value<int> rowid,
    });
typedef $$ConfiguracoesVeiculoTableUpdateCompanionBuilder =
    ConfiguracoesVeiculoCompanion Function({
      Value<String> id,
      Value<String> usuarioId,
      Value<DateTime> criadoEm,
      Value<DateTime> atualizadoEm,
      Value<bool> excluido,
      Value<bool> sincronizado,
      Value<String> tipoCombustivel,
      Value<int> odometroInicial,
      Value<double?> metaConsumoKml,
      Value<int?> metaMensalCentavos,
      Value<int> rowid,
    });

class $$ConfiguracoesVeiculoTableFilterComposer
    extends Composer<_$AppDatabase, $ConfiguracoesVeiculoTable> {
  $$ConfiguracoesVeiculoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoCombustivel => $composableBuilder(
    column: $table.tipoCombustivel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get odometroInicial => $composableBuilder(
    column: $table.odometroInicial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get metaConsumoKml => $composableBuilder(
    column: $table.metaConsumoKml,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get metaMensalCentavos => $composableBuilder(
    column: $table.metaMensalCentavos,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConfiguracoesVeiculoTableOrderingComposer
    extends Composer<_$AppDatabase, $ConfiguracoesVeiculoTable> {
  $$ConfiguracoesVeiculoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usuarioId => $composableBuilder(
    column: $table.usuarioId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get criadoEm => $composableBuilder(
    column: $table.criadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get excluido => $composableBuilder(
    column: $table.excluido,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoCombustivel => $composableBuilder(
    column: $table.tipoCombustivel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get odometroInicial => $composableBuilder(
    column: $table.odometroInicial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get metaConsumoKml => $composableBuilder(
    column: $table.metaConsumoKml,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get metaMensalCentavos => $composableBuilder(
    column: $table.metaMensalCentavos,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConfiguracoesVeiculoTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConfiguracoesVeiculoTable> {
  $$ConfiguracoesVeiculoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get usuarioId =>
      $composableBuilder(column: $table.usuarioId, builder: (column) => column);

  GeneratedColumn<DateTime> get criadoEm =>
      $composableBuilder(column: $table.criadoEm, builder: (column) => column);

  GeneratedColumn<DateTime> get atualizadoEm => $composableBuilder(
    column: $table.atualizadoEm,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get excluido =>
      $composableBuilder(column: $table.excluido, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipoCombustivel => $composableBuilder(
    column: $table.tipoCombustivel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get odometroInicial => $composableBuilder(
    column: $table.odometroInicial,
    builder: (column) => column,
  );

  GeneratedColumn<double> get metaConsumoKml => $composableBuilder(
    column: $table.metaConsumoKml,
    builder: (column) => column,
  );

  GeneratedColumn<int> get metaMensalCentavos => $composableBuilder(
    column: $table.metaMensalCentavos,
    builder: (column) => column,
  );
}

class $$ConfiguracoesVeiculoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConfiguracoesVeiculoTable,
          ConfiguracoesVeiculoData,
          $$ConfiguracoesVeiculoTableFilterComposer,
          $$ConfiguracoesVeiculoTableOrderingComposer,
          $$ConfiguracoesVeiculoTableAnnotationComposer,
          $$ConfiguracoesVeiculoTableCreateCompanionBuilder,
          $$ConfiguracoesVeiculoTableUpdateCompanionBuilder,
          (
            ConfiguracoesVeiculoData,
            BaseReferences<
              _$AppDatabase,
              $ConfiguracoesVeiculoTable,
              ConfiguracoesVeiculoData
            >,
          ),
          ConfiguracoesVeiculoData,
          PrefetchHooks Function()
        > {
  $$ConfiguracoesVeiculoTableTableManager(
    _$AppDatabase db,
    $ConfiguracoesVeiculoTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConfiguracoesVeiculoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConfiguracoesVeiculoTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ConfiguracoesVeiculoTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<String> tipoCombustivel = const Value.absent(),
                Value<int> odometroInicial = const Value.absent(),
                Value<double?> metaConsumoKml = const Value.absent(),
                Value<int?> metaMensalCentavos = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConfiguracoesVeiculoCompanion(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                tipoCombustivel: tipoCombustivel,
                odometroInicial: odometroInicial,
                metaConsumoKml: metaConsumoKml,
                metaMensalCentavos: metaMensalCentavos,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> usuarioId = const Value.absent(),
                Value<DateTime> criadoEm = const Value.absent(),
                Value<DateTime> atualizadoEm = const Value.absent(),
                Value<bool> excluido = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                required String tipoCombustivel,
                required int odometroInicial,
                Value<double?> metaConsumoKml = const Value.absent(),
                Value<int?> metaMensalCentavos = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConfiguracoesVeiculoCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                criadoEm: criadoEm,
                atualizadoEm: atualizadoEm,
                excluido: excluido,
                sincronizado: sincronizado,
                tipoCombustivel: tipoCombustivel,
                odometroInicial: odometroInicial,
                metaConsumoKml: metaConsumoKml,
                metaMensalCentavos: metaMensalCentavos,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $ConfiguracoesVeiculoTable,
                    ConfiguracoesVeiculoData
                  >(table),
                  BaseReferences<
                    _$AppDatabase,
                    $ConfiguracoesVeiculoTable,
                    ConfiguracoesVeiculoData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConfiguracoesVeiculoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConfiguracoesVeiculoTable,
      ConfiguracoesVeiculoData,
      $$ConfiguracoesVeiculoTableFilterComposer,
      $$ConfiguracoesVeiculoTableOrderingComposer,
      $$ConfiguracoesVeiculoTableAnnotationComposer,
      $$ConfiguracoesVeiculoTableCreateCompanionBuilder,
      $$ConfiguracoesVeiculoTableUpdateCompanionBuilder,
      (
        ConfiguracoesVeiculoData,
        BaseReferences<
          _$AppDatabase,
          $ConfiguracoesVeiculoTable,
          ConfiguracoesVeiculoData
        >,
      ),
      ConfiguracoesVeiculoData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PassageirosTableTableManager get passageiros =>
      $$PassageirosTableTableManager(_db, _db.passageiros);
  $$CaronasTableTableManager get caronas =>
      $$CaronasTableTableManager(_db, _db.caronas);
  $$TransacoesTableTableManager get transacoes =>
      $$TransacoesTableTableManager(_db, _db.transacoes);
  $$AbastecimentosTableTableManager get abastecimentos =>
      $$AbastecimentosTableTableManager(_db, _db.abastecimentos);
  $$ConfiguracoesVeiculoTableTableManager get configuracoesVeiculo =>
      $$ConfiguracoesVeiculoTableTableManager(_db, _db.configuracoesVeiculo);
}
