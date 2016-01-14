# Copyright 2016 Altiscale, Inc
#
# Omnibus definition for the verticloudkeydb gem
# simply installs the already published gem

name "verticloudkeydb"
default_version "0.3.0"

dependency "bundler"

build do
  gem "sources -a https://gems.service.verticloud.com"
  gem "install verticloudkeydb -v 0.3.0"
end
