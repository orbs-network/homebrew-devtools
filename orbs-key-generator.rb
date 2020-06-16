
class OrbsKeyGenerator < Formula
  desc "Command line tools for Orbs Network Key Generation"
  homepage "https://github.com/orbs-network/orbs-key-generator"
  url "https://github.com/orbs-network/orbs-key-generator/releases/download/v0.1.1/orbskeygenerator-mac-v0.1.1.tar.gz"
  sha256 "5d2e979981baa549738d80c45adf0197184ad5848c368eb775eb3338ce1126de"
  head "https://github.com/orbs-network/homebrew-devtools"
  
  def install
    system "mkdir", "-p", bin
    system "cp", "./orbs-key-generator", bin/"orbs-key-generator"
  end
  
  def post_install
    s = <<~EOS
***********************************************************************************
                             Orbs Key Generator

 Orbs Key Generator is used to create both client keys (for applications, wallets)
        and Node keys for Validators nodes participating in the network

          Run 'orbs-key-generator help' to see all available commands.

***********************************************************************************

    EOS
    ohai "Done", s
  end

  test do
    system "orbs-key-generator", "version"
  end
end
