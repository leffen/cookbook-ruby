#!/bin/env ruby
require 'berkshelf/vagrant'

Vagrant.configure("2") do |config|
  config.vm.hostname = "chef-ruby"
  config.vm.box = "precise64"

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[ruby::default]",
      "recipe[ruby::chef_wrappers]",
      "recipe[ruby::remove_system_packages]"
    ]
  end
end
