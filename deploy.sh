set -e

######################自定义配置######################

# 项目名称
projectName=economic

# 要上传的文件夹，注意不要忽略最后一个斜杠
dist=./build/

# 编译命令
npm run build

######################通用配置######################

# 机器信息
ip=206.189.178.10
user=root

# 第一次免密登录
# ssh-copy-id $user@$ip

# nginx目录
dir=/home/hooke/www/$projectName/

# 增量上传
ssh $user@$ip "mkdir -p $dir"
rsync -r  --verbose --checksum --progress $dist $user@$ip:$dir/

echo 地址: http://cdn.hooke.site/$projectName/
