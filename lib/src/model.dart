import 'package:flutter/material.dart';

///
///  - V : 黑色，Verbose就是冗长啰嗦的。通常表达开发调试过程中的一些详细信息。
///  - D : 蓝色，Debug来表达调试信息。
///  - I : 绿色，Info来表达一些信息。
///  - W : 橙色，Warn表示警告，但不一定会马上出现错误，开发时有时用来表示特别注意的地方。
///  - E : 红色，Error 出现错误，是最需要关注解决的。
/// E>W>I>D>V
///
class MiniLogLevelEnum {
  static final String _levelStr = "VDIWE";
  final String level;
  final Color color;

  /// 服务器端对应级别
  final String serverTag;

  const MiniLogLevelEnum._(this.level, this.color, this.serverTag);

  static final MiniLogLevelEnum V = MiniLogLevelEnum._('V', Colors.black, 'trace');
  static final MiniLogLevelEnum D = MiniLogLevelEnum._('D', Colors.blue, 'debug');
  static final MiniLogLevelEnum I = MiniLogLevelEnum._('I', Colors.green, 'info');
  static final MiniLogLevelEnum W = MiniLogLevelEnum._('W', Colors.orange, 'warn');
  static final MiniLogLevelEnum E = MiniLogLevelEnum._('E', Colors.red, 'error');
  static final List<MiniLogLevelEnum> all = [V, D, I, W, E];

  static MiniLogLevelEnum of(String level) {
    var index = _levelStr.indexOf(level.toUpperCase());
    if (index > 0) {
      return all[index];
    }
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MiniLogLevelEnum && other.runtimeType == runtimeType && level == other.level);

  @override
  int get hashCode => level.hashCode;

  @override
  String toString() => 'LogTypeEnum{level: $level, color: $color, serverTag: $serverTag}';

  bool operator >=(MiniLogLevelEnum other) =>
      other == null || _levelStr.indexOf(this.level) >= _levelStr.indexOf(other.level);
}

/// 日志 Model
class MiniLogModel {
  /// 日志类型
  MiniLogLevelEnum level;

  /// Tag
  String tag;

  /// 内容
  String content;

  /// 创建时间
  DateTime createTime;

  /// 状态，0-创建，1-提交
  int status;

  MiniLogModel(this.level, this.tag, this.content, this.createTime, this.status);

  @override
  String toString() => '[$tag][${level.level}][${this.createTime.toString()}]: $content';
}

class QueryLogParameter {
  /// 页码，只支持查询
  int pageIndex;

  /// 每页查询大小
  int pageSize;

  /// 包含的等级
  List<MiniLogLevelEnum> level;

  /// 内容查询的关键字
  String searchKey;

  /// 最早时间
  DateTime minTime;

  /// 最晚时间
  DateTime maxTime;

  /// 特定标签
  String tag;

  QueryLogParameter(
      {this.pageIndex = 1,
      this.pageSize = 20,
      this.level,
      this.searchKey,
      this.minTime,
      this.tag,
      this.maxTime});

  @override
  String toString() {
    return 'QueryLogParameter{pageIndex: $pageIndex, pageSize: $pageSize, level: $level, searchKey: $searchKey, minTime: $minTime, maxTime: $maxTime, tag: $tag}';
  }
}
