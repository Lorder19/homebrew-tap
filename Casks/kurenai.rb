cask "kurenai" do
  version "0.4.0"
  sha256 "0f05f6513e46f3c1470309a2637352a5ac42b5646cef7d65200712179810807f"

  url "https://github.com/Lorder19/kurenai/releases/download/v#{version}/Kurenai.zip"
  name "Kurenai"
  desc "Clipboard history, saved lists and a paste queue"
  homepage "https://lorder19.github.io/kurenai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Kurenai.app"

  zap trash: [
    "~/Library/Application Support/Kurenai",
    "~/Library/Application Support/Clippo",
    "~/Library/Preferences/app.clippo.plist",
  ]

  caveats <<~EOS
    Kurenai isn't notarized yet. The first time you open it, macOS will block it:
    open System Settings > Privacy & Security and click "Open Anyway".
    Then allow Kurenai in Accessibility so it can paste for you.
  EOS
end
