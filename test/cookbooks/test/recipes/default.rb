apt_update 'update'

node.normal['java']['jdk_version'] = '8'

include_recipe 'java'
