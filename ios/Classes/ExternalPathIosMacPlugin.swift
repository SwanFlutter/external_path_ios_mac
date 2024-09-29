import Flutter
import UIKit

public class ExternalPathIosMacPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "external_path_ios_mac", binaryMessenger: registrar.messenger())
        let instance = ExternalPathIosMacPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "getDirectoryPath":
            if let args = call.arguments as? [String: Any],
               let directory = args["directory"] as? String {
                let path = getDirectoryPath(for: directory)
                result(path ?? "Unknown directory")
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Directory argument is required", details: nil))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    

    private func getDirectoryPath(for directory: String) -> String? {
        #if os(iOS)
        let baseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        #else
        let baseURL = FileManager.default.urls(for: .userDirectory, in: .userDomainMask).first
        #endif

        var directoryPath: URL?

        switch directory {
        case "DIRECTORY_MUSIC":
            directoryPath = baseURL?.appendingPathComponent("Music")
        case "DIRECTORY_PODCASTS":
            directoryPath = baseURL?.appendingPathComponent("Podcasts")
        case "DIRECTORY_RINGTONES":
            directoryPath = baseURL?.appendingPathComponent("Ringtones")
        case "DIRECTORY_ALARMS":
            directoryPath = baseURL?.appendingPathComponent("Alarms")
        case "DIRECTORY_NOTIFICATIONS":
            directoryPath = baseURL?.appendingPathComponent("Notifications")
        case "DIRECTORY_PICTURES":
            directoryPath = baseURL?.appendingPathComponent("Pictures")
        case "DIRECTORY_MOVIES":
            directoryPath = baseURL?.appendingPathComponent("Movies")
        case "DIRECTORY_DOWNLOADS":
            directoryPath = baseURL?.appendingPathComponent("Downloads")
        case "DIRECTORY_DCIM":
            directoryPath = baseURL?.appendingPathComponent("DCIM")
        case "DIRECTORY_DOCUMENTS":
            directoryPath = baseURL?.appendingPathComponent("Documents")
        case "DIRECTORY_SCREENSHOTS":
            directoryPath = baseURL?.appendingPathComponent("Screenshots")
        case "DIRECTORY_AUDIOBOOKS":
            directoryPath = baseURL?.appendingPathComponent("Audiobooks")
        default:
            return nil
        }

        return directoryPath?.path
    }
}

