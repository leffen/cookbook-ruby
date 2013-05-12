module CheckInstall
  include Chef::Mixin::ShellOut
  
  def ruby_installed?
    return false if node[:ruby][:force_install]
    version = shell_out("ruby -v | grep #{ node[:ruby][:version].gsub( '-', '' ) }").stdout
    not version.empty?
  end
end
