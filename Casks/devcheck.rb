cask "devcheck" do
  version "0.1.0"
  sha256 "8dbd04802b33f21c5c0200db93611e969187a31bbaabad851ed785031f5765d0"

  url "https://github.com/iihao/devcheck/releases/download/v#{version}/DevCheck-#{version}.zip"
  name "DevCheck"
  desc "Menu bar port map: who holds :3000, and which project it belongs to"
  homepage "https://github.com/iihao/devcheck"

  depends_on macos: ">= :sonoma"

  app "DevCheck.app"

  zap trash: [
    "~/Library/Preferences/local.devcheck.plist",
  ]
end
