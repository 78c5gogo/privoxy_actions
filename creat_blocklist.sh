#!/opt/bin/bash
CFG_DIR="/usr/local/etc/privoxy"
#转换chinalist列表。生成过滤域名列表
echo "{+block}" >${CFG_DIR}/chinalist.action
wget -O - http://adblock-chinalist.googlecode.com/svn/trunk/adblock-lazy.txt |gr    ep ^\|\|[^\*]*\^$           |
sed -e 's:||:\.:' -e 's:\^:/:' >>${CFG_DIR}/chinalist.action
#通过mwsl.org.cn，生成过滤域名列表
echo "{+block}" >${CFG_DIR}/mwsl.action
wget -O - http://www.mwsl.org.cn/hosts/hosts |grep ^115\.28\.8\.59.*$|
sed -e 's:^115\.28\.8\.59 :\.:'  >>${CFG_DIR}/mwsl.action
