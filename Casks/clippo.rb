cask "clippo" do
  version "0.3.6"
  sha256 "440dd709506f9ed5c4d821d5dd5428018ea23a2db828dde557a66c294e4e5b2d"

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
