namespace :db do

  namespace :seed do

    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb')
      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end

  end

end
