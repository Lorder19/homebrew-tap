cask "clippo" do
  version "0.3.5"
  sha256 "be2c0c09bd2cbaea19a42d9bb4b5fd4d5727dd99defcd673f35d50747242e63a"

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
