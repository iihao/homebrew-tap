cask "devcheck" do
  version "0.1.1"
  sha256 "a00dd9a2948140f08d7f250af9555cd92aad174dc00682e135773eade70b3f05"

  url "https://github.com/iihao/devcheck/releases/download/v#{version}/DevCheck-#{version}.zip"
  name "DevCheck"
  desc "Menu bar port map: who holds :3000, and which project it belongs to"
  homepage "https://github.com/iihao/devcheck"

  depends_on macos: :sonoma

  app "DevCheck.app"

  # 把 CLI 链进 PATH，否则 README 里的 `devcheck why 5000` 用不了
  binary "#{appdir}/DevCheck.app/Contents/MacOS/DevCheck"

  caveats <<~EOS
    DevCheck is ad-hoc signed (no Apple Developer ID yet), so macOS marks the
    download as quarantined and refuses to launch it. Clear the flag once:

      xattr -dr com.apple.quarantine /Applications/DevCheck.app
  EOS

  zap trash: [
    "~/Library/Preferences/local.devcheck.plist",
  ]
end
