default[:ruby][:version] = '1.9.3-p327'

default[:ruby][:system_packages] = ['ruby', 'ruby19']
default[:ruby][:remove_packages] = true

default[:ruby][:force_install] = false

default[:ruby][:prefix] = '/usr/local'
default[:ruby][:gem_path] = '/usr/local/lib/ruby/gems/1.9.1'
default[:ruby][:gem_home] = '/usr/local/lib/ruby/gems/1.9.1/gems'
