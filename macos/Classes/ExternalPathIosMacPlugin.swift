import Cocoa
import FlutterMacOS

public class ExternalPathIosMacPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "external_path_ios_mac", binaryMessenger: registrar.messenger)
    let instance = ExternalPathIosMacPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "getDirectoryPathMacOs":
      if let args = call.arguments as? [String: Any],
         let directory = args["directory"] as? String {
        let path = getDirectoryPathMacOs(for: directory)
        result(path ?? "Unknown directory")
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Directory argument is required", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getDirectoryPathMacOs(for directory: String) -> String? {
    let baseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

    var directoryPath: URL?

    switch directory {
    case "DIRECTORY_PICTURES":
      directoryPath = baseURL?.appendingPathComponent("Pictures")
    case "DIRECTORY_MOVIES":
      directoryPath = baseURL?.appendingPathComponent("Movies")
    case "DIRECTORY_DOWNLOADS":
      directoryPath = baseURL?.appendingPathComponent("Downloads")
    default:
      return nil
    }

    return directoryPath?.path
  }
}

