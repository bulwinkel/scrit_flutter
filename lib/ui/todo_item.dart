class TodoItem {
  final String title;
  final bool isComplete;

  TodoItem({this.title, this.isComplete = false});

  //region: data class

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TodoItem &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              isComplete == other.isComplete;

  @override
  int get hashCode =>
      title.hashCode ^
      isComplete.hashCode;

  @override
  String toString() {
    return 'TodoItem{title: $title, isComplete: $isComplete}';
  }

  TodoItem copy({final String title, final bool isComplete}) {
    return TodoItem(
      title: title != null ? title : this.title,
      isComplete: isComplete != null ? isComplete : this.isComplete
    );
  }

  //endregion
}

