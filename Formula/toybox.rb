class Toybox < Formula
  head "https://github.com/landley/toybox.git"

  homepage "http://landley.net/toybox/"

  depends_on "gnu-sed" => :build

  def install
    system "make", "macos_defconfig"
    system "make"
    system "make", "install"
  end
end
