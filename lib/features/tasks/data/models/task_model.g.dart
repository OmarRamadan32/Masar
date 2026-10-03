// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 2;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      title: fields[0] as String,
      description: fields[1] as String?,
      date: fields[2] as DateTime,
      time: fields[3] as DateTime,
      category: fields[4] as CategoryModel?,
      priority: fields[5] as String,
      repeatCount: fields[6] as int,
      completedCount: fields[7] as int,
      repeatType: fields[8] as String,
      lastCheckDate: fields[9] as DateTime?,
      previousCheckDate: fields[10] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.priority)
      ..writeByte(6)
      ..write(obj.repeatCount)
      ..writeByte(7)
      ..write(obj.completedCount)
      ..writeByte(8)
      ..write(obj.repeatType)
      ..writeByte(9)
      ..write(obj.lastCheckDate)
      ..writeByte(10)
      ..write(obj.previousCheckDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
