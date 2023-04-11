set :server, :petatoz-admin
set :rails_env, :production
set :branch, 'main'
set :stage, :production

set :puma_threads,    [4, 16]
set :puma_workers,    2
set :puma_phased_restart, true

set :linked_files, %w[config/database.yml config/master.key config/credentials/production.key]

server '3.14.132.56',
       user: 'ubuntu',
       roles: [:web, :app, :db],
       primary: true,
       ssh_options: {
         user: 'ubuntu',
         keys: %w[~/.ssh/petatoz.pem]
       }

