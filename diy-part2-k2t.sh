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

# 修订batman错误
# wget https://github.com/coolsnowwolf/lede/files/14081054/2023.3-batman-adv.tar.gz
# rm -rf feeds/routing/batman-adv
# tar -zxvf 2023.3-batman-adv.tar.gz -C feeds/routing/
# rm -rf 2023.3-batman-adv.tar.gz

# 1.修改默认ip
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 2.修改主机名
sed -i 's/OpenWrt/k2t/g' package/base-files/files/bin/config_generate

# 4.修改版本号
# sed -i "s/OpenWrt /0012h build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 5.修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-ssl-nginx/Makefile
# 或
# default_theme='opentomcat'
# sed -i "s/bootstrap/$default_theme/g" feeds/luci/modules/luci-base/root/etc/config/luci
sed -i "s/luci-static\/bootstrap/luci-static\/argon/g" feeds/luci/modules/luci-base/root/etc/config/luci

# 6.设置ttyd免登录
# sed -i 's/\/bin\/login/\/bin\/login -f root/' /etc/config/ttyd

# 7.修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf


# Enable 802.11 r


