
workers Integer(ENV['WEB_CONCURRENCY'] || 1)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

if ENV['RACK_ENV'] == 'development'
  worker_timeout 3600
end

 on_worker_boot do
   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
 end

plugin :tmp_restart

