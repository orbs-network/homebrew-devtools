
class OrbsKeyGenerator < Formula
  desc "Command line tools for Orbs Network Key Generation"
  homepage "https://github.com/orbs-network/orbs-key-generator"
  url "https://github.com/orbs-network/orbs-key-generator/releases/download/v0.2.0/orbskeygenerator-mac-v0.2.0.tar.gz"
  sha256 "f6204b47c8860e664bbd07d2b007ebc8e7e6adbb7bd1a0e2556976270fef5ec0"
  head "https://github.com/orbs-network/homebrew-devtools"

  devel do
    url "https://github.com/orbs-network/orbs-key-generator/releases/download/v0.2.0/orbskeygenerator-mac-v0.2.0.tar.gz"
    sha256 "f6204b47c8860e664bbd07d2b007ebc8e7e6adbb7bd1a0e2556976270fef5ec0"
  end
  
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
