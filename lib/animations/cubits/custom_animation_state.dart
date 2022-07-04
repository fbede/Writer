part of 'custom_animation_cubit.dart';

class CustomAnimationState extends Equatable {
  const CustomAnimationState({required this.id, required this.value});

  final String id;
  final double value;

  CustomAnimationState copyWith({id, value}) {
    return CustomAnimationState(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  String toString() {
    return '''CustomAnimationState { status: $id, hasReachedMax: $value}''';
  }

  @override
  List<Object> get props => [id, value];
}
