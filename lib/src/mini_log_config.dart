import 'model.dart';

/// 日志上传事件
/// [value] 等待上传的日志！
/// [value] 反馈是否处理成功！
typedef UpLogEvent = Future<bool> Function(MiniLogModel value);

/// 日志配置
class MiniLogConfig {
  /// 是否打印日志
  bool withPrint;

  /// 最小打印日志等级
  MiniLogLevelEnum minPrintLevel;

  /// 是否保存到数据库
  bool withSQLite;

  /// 最小保存日志等级
  MiniLogLevelEnum minSQLiteLevel;

  /// 最小上传日志等级
  MiniLogLevelEnum minUpLevel;

  /// 日志上传事件，不设置时不上传，将在每次打印时，结合[minUpLevel]判断是否上传
  UpLogEvent upLogEvent;

  /// 日志标签
  String tag;

  bool withPrintColor;

  /// 初始化配置
  /// - [minPrintLevel] - 最小打印等级，默认 [MiniLogLevelEnum.D]
  /// - [minSQLiteLevel] - 最小保存日志等级，默认 [MiniLogLevelEnum.I]
  /// - [minUpLevel] - 最小上传等级，默认 [MiniLogLevelEnum.W]
  MiniLogConfig(
      {this.withPrint = true,
      MiniLogLevelEnum minPrintLevel,
      this.withSQLite = false,
      MiniLogLevelEnum minSQLiteLevel,
      MiniLogLevelEnum minUpLevel,
      this.upLogEvent,
      this.withPrintColor = false,
      this.tag = "mini_log"}) {
    this.minPrintLevel = minPrintLevel ?? MiniLogLevelEnum.D;
    this.minSQLiteLevel = minSQLiteLevel ?? MiniLogLevelEnum.I;
    this.minUpLevel = minUpLevel ?? MiniLogLevelEnum.W;
  }
}
