module PawPunk.Funcs

import RedData.Json.*
import RedFileSystem.*



public func SerializeObject(obj: ref<IScriptable>) -> String {
    return ToJson(obj).ToString("\t");
}

public func GetStorage(name: String) -> ref<FileSystemStorage> {
    let storage = FileSystem.GetStorage(name);
    if IsDefined(storage) {
        for file in storage.GetFiles() {
            Log(s"Found file: \(file.GetFilename())");
        }
        return storage;
    } else {
        Log("Storage not defined");
    }
    return null;
}

public func GetStorageFile(storage: ref<FileSystemStorage>, fileName: String) -> ref<File> {
    let status = storage.Exists(fileName);
    RaiseForStatus(status);
    let file = storage.GetFile(fileName);
    if !IsDefined(file) {
        Log(
            s"File not found or invalid at {GAMEDIR}/r6/storages/Alberta/\(fileName)."
        );
        return null;
    }
    Log(s"File found: \(file.GetFilename())");
    return file;
}

public func RaiseForStatus(status: FileSystemStatus) -> Void {
    if Equals(status, FileSystemStatus.Failure) {
        Log("System error.");
    } else if Equals(status, FileSystemStatus.Denied) {
        Log("Operation denied.");
    } else if Equals(status, FileSystemStatus.False) {
        Log("File/Directory not found.");
    } else if Equals(status, FileSystemStatus.True) {
        Log("File/Directory is present.");
    }
}
