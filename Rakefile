CONFIG_ROOT = File.expand_path('../', __FILE__)

desc 'Pull configs from remote'
task :pull do
  Dir.chdir(CONFIG_ROOT) do
    sh 'git checkout master'
    sh 'git pull origin master --rebase'
  end
end

desc 'Install the config files'
task :install do
  Dir.chdir(ENV['HOME']) do
    ln_s File.join(CONFIG_ROOT, 'git', 'config'), '.gitconfig'
  end
end

desc 'Update and install'
task :update => [:pull, :install]
