default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }
set :use_sudo, false
set :user, "deploy"

set :application, "awesomefound"
set :deploy_to, "/opt/apps/#{application}"
set :deploy_via, :remote_cache
set :copy_exclude, [".gitignore", ".gitkeep", ".git/*"]
set :scm, :git
set :repository, "git@github.com:jonpierce/awesomefoundation.git"
set :branch, "master"

set :server_name, "69.164.211.197"
role :web, server_name
role :app, server_name
role :db, server_name, :primary => true

set :keep_releases, 3

namespace :deploy do
  task :start do; end
  task :stop do; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :deploy do
  namespace :web do
    # desc "Serve up a custom maintenance page."
    # task :disable, :roles => :web do
    #   require "erb"
    #   on_rollback { run "rm #{shared_path}/system/maintenance.html" }
    #   reason = ENV["REASON"]
    #   deadline  = ENV["UNTIL"]
    #   template = File.read("app/views/home/maintenance.html.erb")
    #   page = ERB.new(template).result(binding)
    #   put page, "#{shared_path}/system/maintenance.html", :mode => 0644
    # end
  end
end

before "deploy", "deploy:web:disable"
after "deploy", "deploy:web:enable"

before "deploy:migrations", "deploy:web:disable"
after "deploy:migrations", "deploy:web:enable"

namespace :apache do  
  task :start, :roles => :web do
    run "#{sudo} apache2ctl start"
  end  
  task :stop, :roles => :web do
    run "#{sudo} apache2ctl graceful-stop"
  end
  task :restart, :roles => :web do
    run "#{sudo} apache2ctl graceful"
  end
end
