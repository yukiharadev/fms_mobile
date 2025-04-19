part of 'file_bloc.dart';

sealed class FileEvent extends Equatable {
  const FileEvent();

  @override
  List<Object> get props => [];
}

class FileUploadRequested extends FileEvent {
  final PlatformFile file;
  const FileUploadRequested({required this.file});

  @override
  List<Object> get props => [file];
}

class FileDeleteRequested extends FileEvent {
  final String fileId;
  const FileDeleteRequested({required this.fileId});

  @override
  List<Object> get props => [fileId];
}

class FileGetRequested extends FileEvent {
  final String fileId;
  const FileGetRequested({required this.fileId});

  @override
  List<Object> get props => [fileId];
}
