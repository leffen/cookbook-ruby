#
# Author:: Cassiano Leal (<cassianoleal@gmail.com>)
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2008-2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef::Recipe
  include CheckInstall
end

### Most of the code from https://github.com/carlo/chef-ruby1.9

include_recipe "apt"
include_recipe "build-essential"

include_recipe "ruby::remove_system_packages" if node[:ruby][:remove_packages]

%w(wget zlib1g-dev libssl-dev libffi-dev libxml2-dev libncurses5-dev libreadline-dev libyaml-dev).each do |pkg|
  package pkg do
    action :install
  end
end

unless ruby_installed? then
  execute "get & unpack #{ node[:ruby][:version] }" do
    user "root"
    command "cd /usr/src && wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{ node[:ruby][:version] }.tar.bz2 && tar xjf ruby-#{ node[:ruby][:version] }.tar.bz2 && cd ruby-#{ node[:ruby][:version] }"
  end

  execute "configure & make #{ node[:ruby][:version] }" do
    user "root"
    command "cd /usr/src/ruby-#{ node[:ruby][:version] } && ./configure && make && make install"
  end

  %w( openssl readline ).each do |ext|
    execute "configure & make #{ node[:ruby][:version] } #{ext} support" do
      user "root"
      command "cd /usr/src/ruby-#{ node[:ruby][:version] }/ext/#{ext}/ && ruby extconf.rb && make && make install"
    end
  end
end

include_recipe "ruby::chef_wrappers"
