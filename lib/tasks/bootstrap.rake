namespace :bootstrap do
      
  desc "Add the Admin user"
  task :admin => :environment do
    User.create( :first_name => 'admin', :email => 'admin@website.com', :password => '12345678', :admin => true )
    puts "Admin user created. \n- Email: admin@website.com \n- Password: 12345678"
  end

  desc "Create website configuration"
  task :config => :environment do
    Info.create( :website_name => 'Website', :tagline => 'A Ruby on Rails app template', :default_language => 'en' )
    puts "Website configured!"
  end

  desc "Run all bootstrapping tasks"
  task :all => [:admin, :config]
  end