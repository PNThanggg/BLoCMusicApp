import 'package:bloc/bloc.dart';

import '../../../models/media_item_model.dart';
import '../../../utils/global_const.dart';

part 'add_to_playlist_state.dart';

class AddToPlaylistCubit extends Cubit<AddToPlaylistState> {
  AddToPlaylistCubit() : super(AddToPlaylistInitial());

  void setMediaItemModel(MediaItemModel mediaItemModel) {
    emit(state.copyWith(mediaItemModel: mediaItemModel));
  }
}
