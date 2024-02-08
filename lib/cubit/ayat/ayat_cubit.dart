// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_ahlul_quran_app/data/model/detail_surah.dart';
import 'package:flutter_ahlul_quran_app/data/sevice_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ayat_state.dart';


class AyatCubit extends Cubit<AyatState> {
  AyatCubit(
    this.apiService,
  ) : super(AyatInitial());


  final ApiService apiService;


  void getDetailSurah(int noSurah) async {
    emit(AyatLoading());
    final result = await apiService.getDetailSurah(noSurah);


    result.fold(
      (l) => emit(AyatError(message: l)),
      (r) => emit(AyatLoaded(detail: r)),
    );
  }
}





