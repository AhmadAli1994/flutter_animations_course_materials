import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker_flutter/models/task.dart';
import 'package:habit_tracker_flutter/persistence/hive_data_store.dart';
import 'package:habit_tracker_flutter/ui/home/tasks_grid_page.dart';
import 'package:hive/hive.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetReference ref) {
    final dataStore = ref.watch(dataStoreProvider);
    return ValueListenableBuilder(
      valueListenable: dataStore.tasksListenable(),
      builder: (_, Box<Task> box, __) => TasksGridPage(
        tasks: box.values.toList(),
      ),
    );
  }
}
