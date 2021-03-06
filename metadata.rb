name             "localshop"
maintainer       "Needle Operations"
maintainer_email "cookbooks@needle.com"
license          "Apache 2.0"
description      "Installs/Configures localshop caching pypi server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.12.0"

depends 'application_python'
depends 'nginx'
depends 'python'
depends 'build-essential'
