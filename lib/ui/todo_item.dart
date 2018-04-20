class TodoItem {
  final String title;
  final bool isComplete;
  final bool isInEditMode;

  TodoItem({this.title, this.isComplete = false, this.isInEditMode = false});

  //region: data class

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TodoItem &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              isComplete == other.isComplete &&
              isInEditMode == other.isInEditMode;

  @override
  int get hashCode =>
      title.hashCode ^
      isComplete.hashCode ^
      isInEditMode.hashCode;

  @override
  String toString() {
    return 'TodoItem{title: $title, isComplete: $isComplete, isInEditMode: $isInEditMode}';
  }

  TodoItem copy({final String title, final bool isComplete, final bool isInEditMode}) {
    return TodoItem(
      title: title != null ? title : this.title,
      isComplete: isComplete != null ? isComplete : this.isComplete,
      isInEditMode: isInEditMode != null ? isInEditMode : this.isInEditMode,
    );
  }

  //endregion
}

