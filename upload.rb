require 'rubygems'
require 'bundler/setup'
require 'variable_uploader'

include GoodData::VariableUploader::DSL

Project.update :login => 'login', :pass => 'pass', :pid => 'pid' do
  upload({
    :file => 'values/data.csv',
    :variable => '/gdc/md/PID/obj/ID',
    :label =>"/gdc/md/PID/obj/ID"
  })
end