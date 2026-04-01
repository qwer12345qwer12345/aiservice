import 'dart:typed_data';
import '../../core/interfaces/file_service.dart';
import '../data_sources/local_file_source.dart';

class FileService implements IFileService {
  final ILocalFileSource _fileSource;

  FileService(this._fileSource);

  @override
  Future<String> saveAttachment(Uint8List data, String fileName) async {
    return await _fileSource.saveAttachment(data, fileName);
  }

  @override
  Future<Uint8List> readAttachment(String relativePath) async {
    return await _fileSource.readAttachment(relativePath);
  }

  @override
  Future<void> deleteAttachment(String relativePath) async {
    await _fileSource.deleteFile(relativePath);
  }
}