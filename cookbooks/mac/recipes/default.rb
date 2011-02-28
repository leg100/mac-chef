include_recipe "chef-homebrew"

homedir = "/Users/#{node[:current_user]}"

directory "/usr/local" do
  owner     node[:current_user]
  group     "wheel"
  mode      "0755"
end

template "#{homedir}/.gemrc" do
  source    "_gemrc.erb"
  owner     node[:current_user]
  group     "staff"
  mode      "0644"
end

link "/usr/local/bin/gitx" do
  to "/Applications/GitX.app/Contents/Resources/gitx"
  only_if "test -x /Applications/GitX.app/Contents/Resources/gitx"
end

node[:gems].each {|p| gem_package p }
node[:brews].each {|p| package p }

file "/usr/local/Cellar/htop/HEAD/bin/htop" do
  owner     "root"
  group     "staff"
  mode      "6555"
end

cookbook_file "#{homedir}/.htoprc" do
  source  "_htoprc"
  owner   node[:current_user]
  group   "staff"
end

template "#{homedir}/.nabaztag" do
  source    "_nabaztag.erb"
  owner     node[:current_user]
  group     "staff"
  mode      "0644"
  not_if   { node[:nabaztag][:mac].nil? || node[:nabaztag][:token].nil? }
end

cookbook_file "/usr/local/bin/keychain" do
  source    "keychain"
  owner     node[:current_user]
  group     "staff"
  mode      "0755"
end

template "#{homedir}/.s3cfg" do
  owner     node[:current_user]
  group     "staff"
  mode      "0600"
  source    "_s3cfg.erb"
  not_if   { node[:aws][:access_key].nil? || node[:aws][:secret_key].nil? }
end

