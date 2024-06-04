#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#优先安装 passwall 源
./scripts/feeds install -a -f -p passwall_packages
./scripts/feeds install -a -f -p passwall_luci

#下载N2N
git clone https://github.com/coolsnowwolf/packages lean/packages
cp -Rf lean/packages/net/n2n ./feeds/packages/net/n2n

git clone https://github.com/coolsnowwolf/luci lean/luci
cp -Rf lean/luci/applications/luci-app-n2n ./feeds/luci/applications/luci-app-n2n

rm -rf lean
./scripts/feeds update -a
