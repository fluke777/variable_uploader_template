require 'rubygems'
require 'bundler/setup'
require 'user_hierarchies'

GoodData::UserHierarchies::UserHierarchy::read_from_csv("../data/data.csv", {
    :user_id => :Id,
    :manager_id => :ManagerId,
    :description_field => :Email
}) do |hierarchy|
    hierarchy.users.each do |user|
        puts "#{user.Email} => #{user.all_subordinates.map {|s| s.Email}.join(", ")}"
    end
end