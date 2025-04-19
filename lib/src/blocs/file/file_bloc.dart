import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

import '../../repositories/file_repository.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final FileRepository fileRepository;

  // Constructor
  FileBloc({required this.fileRepository}) : super(FileInitial()) {
    on<FileUploadRequested>(_onFileUploadRequested);
    on<FileDeleteRequested>(_onFileDeleteRequested);
    on<FileGetRequested>(_onFileGetRequested);
  }

  Future<void> _onFileUploadRequested(FileUploadRequested event, Emitter<FileState> emit) async {
    emit(FileLoading());
    try {
      final fileUrl = await fileRepository.uploadFile(event.file);
      emit(FileUploadSuccess(filePath: fileUrl));
    } catch (e) {
      emit(FileError(message: e.toString()));
    }
  }

  Future<void> _onFileDeleteRequested(FileDeleteRequested event, Emitter<FileState> emit) async {
    emit(FileLoading());
    try {
      await fileRepository.deleteFile(event.fileId);
      emit(FileUploadSuccess(filePath: event.fileId));
    } catch (e) {
      emit(FileError(message: e.toString()));
    }
  }

  Future<void> _onFileGetRequested(FileGetRequested event, Emitter<FileState> emit) async {
    emit(FileLoading());
    try {
      final fileUrl = await fileRepository.getFile(event.fileId);
      emit(FileUploadSuccess(filePath: fileUrl));
    } catch (e) {
      emit(FileError(message: e.toString()));
    }
  }
}
