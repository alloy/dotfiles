CONFIG_ROOT = File.expand_path('../', __FILE__)

desc 'Install the config files'
task :install do
  Dir.chdir(ENV['HOME']) do
    ln_s File.join(CONFIG_ROOT, 'git', 'config'), '.gitconfig'
  end
end
