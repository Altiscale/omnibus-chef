# Copyright 2016 Altiscale, Inc
#
# Omnibus definition for the verticloudkeydb gem
# simply installs the already published gem

name "mysql_gem"
default_version "2.9.1"

build do
  gem "install mysql -v 2.9.1"
end
