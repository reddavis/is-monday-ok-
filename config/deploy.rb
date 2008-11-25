set :application, "is_monday_ok"

default_run_options[:pty] = true

ssh_options[:forward_agent] = true

default_run_options[:pty] = true
set :repository,  "git@gitbase.com:dancingorange/is-monday-ok.git"
set :scm, "git"
#set :scm_passphrase, "p@ssw0rd" #This is your custom users password
set :user, "root"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/usr/local/www/#{application}"

role :app, "67.207.149.24"
role :web, "67.207.149.24"
role :db,  "67.207.149.24", :primary => true

#required for OS X!!!
on :start do
  `ssh-add`
end

namespace :deploy do
  task :start do
    before_deploy
    sleep(10)
    run "cd #{current_path}; rm log -rf && mkdir log"
    run "cd #{current_path}; merb -p 5000 -e production -a thin -d -c 2"
    #run "monit"
  end
  
  task :stop do
    before_deploy
  end
  
  task :restart do
    #sudo /etc/init.d/nginx start
    #run "sudo kill `cat /usr/local/nginx/logs/nginx.pid`"
    #run "sudo /usr/local/sbin/nginx"
    start
  end
  
  task :restart_nginx do
    
  end
  
  task :before_deploy do
    #run "monit quit"
    run "merb -m #{current_path} -K all"
    #run "cd #{current_path}; rm log -r" # Removes PID files just incase
  end

end