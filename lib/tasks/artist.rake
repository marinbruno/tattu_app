namespace :artist do
  desc "Updates info on instagram from all Artist with o description"
  task ig_update_all: :environment do
    Artist.where(description: nil).each(&:update_instagram_data!)
  end
end
