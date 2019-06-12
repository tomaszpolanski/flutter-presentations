// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Cocoa

class ExampleWindow: NSWindow {
  @IBOutlet weak var flutterViewController: FLEViewController!

  override func awakeFromNib() {
    var framee = self.frame
    framee.size = CGSize(width: 800, height: 600)
    self.setFrame(framee, display: true, animate: false)
    PluginRegistrant.register(with: flutterViewController)

    let assets = NSURL.fileURL(withPath: "flutter_assets", relativeTo: Bundle.main.resourceURL)
    var arguments: [String] = [];
    flutterViewController.launchEngine(
      withAssetsPath: assets,
      commandLineArguments: arguments)

    super.awakeFromNib()
  }
}

