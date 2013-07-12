#!/bin/env ruby
require 'berkshelf/vagrant'

Vagrant.configure("2") do |config|
  config.vm.hostname = "chef-ruby"
  config.vm.box = "precise64"

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.json = {

            :ruby => {:version => '2.0.0-p247',
                      :prefix => '/usr/local',
                      :src_path => 'ftp://ftp.ruby-lang.org/pub/ruby/2.0/',
                      :gem_path => "/usr/local/lib/ruby/gems/2.0.0",
                      :gem_home => "/usr/local/lib/ruby/gems/2.0.0/gems"
            }
    }
    chef.run_list = [
            "recipe[ruby::default]",
            "recipe[ruby::chef_wrappers]",
            "recipe[ruby::remove_system_packages]"
    ]
  end
end
