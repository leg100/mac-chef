include_recipe "chef-homebrew"

package "redis"

execute "setup_redis_launch_agent" do
  command <<-EOF
REDIS_VERSION=$(brew list --versions redis | awk '{ print $2 }')
cp /usr/local/Cellar/redis/${REDIS_VERSION}/io.redis.redis-server.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/io.redis.redis-server.plist
EOF
  user node[:current_user]
  not_if do
    File.exists? "/Users/#{node[:current_user]}/Library/LaunchAgents/io.redis.redis-server.plist" \
    || `launchctl list` =~  /io.redis.redis-server/
  end
end