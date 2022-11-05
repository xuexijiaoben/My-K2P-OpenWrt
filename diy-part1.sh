#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

rm -rf package/lean/luci-app-ikoolproxy
rm -rf package/lean/luci-app-ikoolproxy2
git clone https://github.com/ilxp/luci-app-ikoolproxy2.git package/lean/luci-app-ikoolproxy

# rm -rf package/feeds/luci/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config
# echo '### Argon Theme Config ###'

./scripts/feeds update -a
./scripts/feeds install -a
