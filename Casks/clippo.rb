cask "clippo" do
  version "0.3.4"
  sha256 "0f517fbc139beb1d65418e04a20499df93e54b777dd873bbac0091d4fd172f18"

  url "https://github.com/Lorder19/clippo/releases/download/v#{version}/Clippo.zip"
  name "Clippo"
  desc "Clipboard history, saved lists and a paste queue"
  homepage "https://lorder19.github.io/clippo/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Clippo.app"

  zap trash: [
    "~/Library/Application Support/Clippo",
    "~/Library/Preferences/app.clippo.plist",
  ]

  caveats <<~EOS
    Clippo isn't notarized yet. The first time you open it, macOS will block it:
    open System Settings > Privacy & Security and click "Open Anyway".
    Then allow Clippo in Accessibility so it can paste for you.
  EOS
end
