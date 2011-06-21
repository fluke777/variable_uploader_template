require 'rubygems'
require 'bundler/setup'
require 'user_hierarchies'
require 'fastercsv'

FasterCSV.open(File.expand_path("../../values/data.csv", __FILE__), "w") do |csv|
  GoodData::UserHierarchies::UserHierarchy::read_from_csv(File.expand_path("../../data/data.csv", __FILE__), {  
    :user_id => "Id",
    :manager_id => "ManagerId",
    :description_field => "Email"
  }) do |hierarchy|
      hierarchy.users.each do |user|
        csv << [user.Email, user.Email] + user.all_subordinates.map {|s| s.Email}
      end
  end
end