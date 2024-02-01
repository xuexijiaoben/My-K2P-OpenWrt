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

# 目前兼容Luci18
# echo 'ssrc-git opentopd  https://github.com/sirpdboy/luci-theme-opentopd' >>feeds.conf.default

git clone --depth 1 https://github.com/ilxp/luci-app-ikoolproxy.git package/app/luci-app-ikoolproxy

# rm -rf package/feeds/luci/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/feeds/luci/luci-theme-argon
# git clone https://github.com/jerrykuku/luci-app-argon-config.git package/lean/luci-app-argon-config
# echo '### Argon Theme Config ###'

./scripts/feeds update -a
./scripts/feeds install -a
