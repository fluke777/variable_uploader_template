require 'rubygems'
require 'bundler/setup'
require 'user_hierarchies'
require 'fastercsv'
                                                         
GoodData::UserHierarchies::UserHierarchy::load_from_sf('login', 'pass') do |hierarchy|
    hierarchy.users.each do |user|
      puts "#{user.Email}(#{user.Id}) -> #{user.all_subordinates.map {|u| u.Username}.join(", ")}" if user.is_manager?
    end
end
