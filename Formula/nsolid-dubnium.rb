class NsolidDubnium < Formula
  desc "N|Solid Runtime Dubnium"
  homepage "https://nodesource.com/products/nsolid"
  url "https://s3-us-west-2.amazonaws.com/nodesource-public-downloads/3.13.1/artifacts/bundles/nsolid-bundle-v3.13.1-darwin-x64/nsolid-v3.13.1-dubnium-darwin-x64.tar.gz"
  sha256 "f94c4f64ee83413f656eee31ec8ea02c6a2576d39929098b1c9370b3208a7fc6"
  version "3.13.1"

  conflicts_with "node", :because => "N|Solid is a replacement for NodeJS"
  conflicts_with "nsolid", :because => "N|Solid Dubnium is a replacement for N|Solid Erbium"
  depends_on :macos => :yosemite

  bottle :unneeded

  option "without-node", "Won't symlink node, npm, and npx in /usr/local/bin/ to the N|Solid versions"

  def install
    lib.install Dir["lib/*"]
    share.install Dir["share/*"]
    include.install Dir["include/*"]
    if build.without? "node"
      bin.install Dir["bin/nsolid"]
      bin.install Dir["bin/nsolid-cli"]
    else
      bin.install Dir["bin/*"]
    end
  end

  def test
    system "nsolid", "-vv"
    system "nsolid-cli", "-v"
  end
end
