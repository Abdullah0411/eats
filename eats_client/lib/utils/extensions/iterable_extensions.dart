extension SafeAccess<T> on Iterable<T> {
  T? safeElementAt(int index) => length <= index ? null : elementAt(index);
}
extension ListSafeAccess<T> on List<T> {
  T? safeElementAt(int index) => length <= index ? null : elementAt(index);
}
