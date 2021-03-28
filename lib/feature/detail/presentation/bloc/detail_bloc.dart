import 'package:bloc/bloc.dart';
import 'package:clean_architecture_bloc/feature/detail/domain/usecases/get_detail.dart'
    as detail;
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/detail_event.dart';
import 'package:clean_architecture_bloc/feature/detail/presentation/bloc/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final detail.GetDetail getDetail;

  DetailBloc({required this.getDetail}) : super(DetailInitialState());

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is GetDetailEvent) {
      yield DetailLoadingState();
      final moviesFailedOrSuccess =
          await getDetail(detail.Params(id: event.id));
      yield moviesFailedOrSuccess.fold((l) => DetailLoadFailedState(),
          (r) => DetailLoadSuccessState(detail: r));
    }
  }
}
