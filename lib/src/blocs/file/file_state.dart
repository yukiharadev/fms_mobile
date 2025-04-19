part of 'file_bloc.dart';

sealed class FileState extends Equatable {
  const FileState();

  @override
  List<Object> get props => [];
}

class FileInitial extends FileState {
  const FileInitial();
}

class FileLoading extends FileState {
  const FileLoading();
}

class FileUploadSuccess extends FileState {
  final String filePath;
  const FileUploadSuccess({required this.filePath});

  @override
  List<Object> get props => [filePath];
}

class FileError extends FileState {
  final String message;
  const FileError({required this.message});

  @override
  List<Object> get props => [message];
}
