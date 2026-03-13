enum StateManagement { riverpod, bloc }

class AppConfig {
  static const _value = String.fromEnvironment(
    'STATE_MGMT',
    defaultValue: 'bloc',
  );

  static StateManagement get stateManagement {
    switch (_value) {
      case 'bloc':
        return StateManagement.bloc;
      case 'riverpod':
      default:
        return StateManagement.riverpod;
    }
  }
}
