import 'package:flutter_bloc/flutter_bloc.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(CubitInitial());

  static CubitCubit get(context) => BlocProvider.of(context);

  bool yes = false;

  void makeYes() {
    yes = true;
    emit(Yes());
  }
}
