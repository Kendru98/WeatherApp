// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityItemAdapter extends TypeAdapter<CityItem> {
  @override
  final int typeId = 1;

  @override
  CityItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityItem(
      lat: fields[0] as double,
      lon: fields[1] as double,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
