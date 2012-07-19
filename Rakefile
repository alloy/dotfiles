CONFIG_ROOT = File.expand_path('../', __FILE__)

def symlink(from, to)
  from = File.join(CONFIG_ROOT, from)
  if !File.exist?(to)
    ln_s(from, to)
  elsif !File.symlink?(to) || File.readlink(to) != from
    raise "A file already exists at `#{to}' and is not a symlink to `#{from}'"
  end
end

desc 'Pull configs from remote'
task :pull do
  Dir.chdir(CONFIG_ROOT) do
    sh 'git checkout master'
    sh 'git pull origin master'
  end
end

desc 'Install the config files'
task :install do
  Dir.chdir(ENV['HOME']) do
    symlink 'git/config', '.gitconfig'
  end
end

desc 'Update and install'
task :update => [:pull, :install]
