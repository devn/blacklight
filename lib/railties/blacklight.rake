
namespace :blacklight do
  # task to clean out old, unsaved searches
  # rake blacklight:delete_old_searches[days_old]
  # example cron entry to delete searches older than 7 days at 2:00 AM every day: 
  # 0 2 * * * cd /path/to/your/app && /path/to/rake blacklight:delete_old_searches[7] RAILS_ENV=your_env
  desc "Removes entries in the searches table that are older than the number of days given."
  task :delete_old_searches, [:days_old] => [:environment] do |t, args|
    args.with_defaults(:days_old => 7)    
    Search.delete_old_searches(args[:days_old].to_i)
  end

  task :delete_old_guests, [:days_old] => [:environment] do |t, args|
    args.with_defaults(:days_old => 30)

    days_old = args[:days_old].to_i
    raise "Days old must be a value greater than 0" unless days_old > 0
    
    deleted = User.where(:guest => true).where("created_at <= ?", days_old.days.ago).delete_all

    puts "#{deleted} guests deleted from before #{days_old} days ago."
  end
end
  

