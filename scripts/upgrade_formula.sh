#!/bin/bash

sed -i '' "s@url.*@url \"https://github.com/oracle/oci-cli/archive/${version}.tar.gz\"@g" oci-cli.rb
url=$(grep "url" oci-cli.rb)
awk '/url.*$/ { printf("%s", $0); next } 1' oci-cli.rb > tmp && mv tmp oci-cli.rb
sed -i '' "s@.*url.*@${url}@" oci-cli.rb

sed -i '' "s@.*url.*@${url}  sha256 \"${SHA256}\"@g" oci-cli.rb
awk '{sub(/  sha256/,"\n  sha256");}1' oci-cli.rb > tmp && mv tmp oci-cli.rb