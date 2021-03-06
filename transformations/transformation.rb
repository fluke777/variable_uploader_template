require 'rubygems'
require 'bundler/setup'
require 'user_hierarchies'

GoodData::UserHierarchies::UserHierarchy::read_from_csv(File.expand_path("../../data/data.csv", __FILE__), {  
  :user_id => "Id",
  :manager_id => "ManagerId",
  :description_field => "Email"
}) do |hierarchy|
    hierarchy.users.each do |user|
      puts "#{user.Email} => #{([user] + user.all_subordinates).map {|s| s.Email}.join(", ")}"
      # puts "#{user.Email} => #{user.all_subordinates.size}"
      # puts "#{user.Email}" if user.is_manager?
    end
end