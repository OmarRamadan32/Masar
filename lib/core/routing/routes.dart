abstract class AppRoutes {
  // --Notes branch
  static const notes = '/';
  static const note = '/note';
  // --Tasks branch
  static const tasks = '/tasks';
  // --Categories branch
  static const categories = '/categories';
  // --Settings branch
  static const settings = '/settings';

  static const List<String> mainRoutes = [
    notes,
    tasks,
    categories,
    settings,
  ];
}