import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/widgets.dart';

/// Emita um registro no log.
///
/// Esta função foi projetada para mapear de perto as informações
/// de registro coletadas pelo `package:logging`.
///
/// - [message] é a mensagem de log
/// - [time] (optional) é o carimbo de data / hora
/// - [sequenceNumber] (optional) é um número de sequência monotonicamente crescente
/// - [level] (optional) é o nível de gravidade (um valor entre 0 e 2000); veja
///   o `package:logging` `Level` classe de registro para uma visão geral dos valores possíveis
///   the `package:logging` `Level` class for an overview of the possible values
/// - [name] (optional) é o nome da fonte da mensagem de log
/// - [zone] (optional) a zona onde o registro foi emitido
/// - [error] (optional)  um objeto de erro associado a este evento de log
/// - [stackTrace] (optional) um rastreamento de pilha associado a este evento de log
///
class Logger {
  String message = '';
  DateTime time;
  int sequenceNumber;
  int level = 0;
  String name = '';
  Zone zone;

  Logger({
    @required this.message,
    this.time,
    this.sequenceNumber,
    this.level,
    this.name,
    this.zone,
  });

  info() {
    developer.log(
      message,
      name: 'INFO',
      time: DateTime.now(),
    );
  }

  warning({@required Object error}) {
    developer.log(
      message,
      name: 'WARNING',
      error: error.toString(),
      time: DateTime.now(),
    );
  }

  error({@required Object error, @required StackTrace stackTrace}) {
    developer.log(
      message,
      name: 'ERROR',
      error: error.toString(),
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
  }

  inspect() {
    developer.inspect(message);
  }
}
