class Omega < Formula
  desc "Packaged search engine for websites, built on top of Xapian"
  homepage "https://xapian.org/"
  url "https://oligarchy.co.uk/xapian/1.4.14/xapian-omega-1.4.14.tar.xz"
  sha256 "8b2b16cd52409c35507d1103cbdf10d9eabd0b5df64d9f34f0c9065a5d0286c3"

  bottle do
    sha256 "dc1d707250e36287e84d862455967778da56bec1490705f0037fc0d285a47ea3" => :catalina
    sha256 "7ee5c35a62e2e785ef015af5de4a11698d4cfbc0acecc5f6233b5c600fb97d39" => :mojave
    sha256 "7af4cfd727e0c504db0598558de51b315c1f161505bcffef7d73097f5c0b36bb" => :high_sierra
  end

  depends_on "libmagic"
  depends_on "pcre"
  depends_on "xapian"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/omindex", "--db", "./test", "--url", "/", "#{share}/doc/xapian-omega"
    assert_predicate testpath/"./test/flintlock", :exist?
  end
end
