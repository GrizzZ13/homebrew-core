class Sshpass < Formula
  desc "Non-interactive ssh password auth"
  homepage "https://sourceforge.net/projects/sshpass/"
  url "https://master.dl.sourceforge.net/project/sshpass/sshpass/1.10/sshpass-1.10.tar.gz"
  sha256 "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"
  license "GPL-2.0-or-later"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  def caveats
    <<~EOS
      Sshpass is a tool for non-interactivly performing password authentication
      with SSH's so called "interactive keyboard password authentication".
      Most user should use SSH's more secure public key authentiaction instead.

      See `man sshpass` for more information.
    EOS
  end

  test do
    system "#{bin}/sshpass", "-V"
  end
end
