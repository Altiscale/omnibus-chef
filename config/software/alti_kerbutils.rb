# Copyright 2016 Altiscale, Inc
#
# Pulls kerbutils and associated dependencies into the omnibus chef
# consuming already published gems

name "alti_kerbutils"

build do
  gem "sources -a https://gems.service.verticloud.com"
  gem "install alti_kerbutil -v 0.1.0"
  gem "install kdcclientlib -v 0.0.1"
  gem "install retries -v 1.0.0"
  gem "install rest-client-helper -v 0.4.1"
end
