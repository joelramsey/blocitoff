#Job to automate the delete_items task
set :environment, "development" 
every :hour do
   rake "todo:delete_items"
 end

every :reboot do
  rake "todo:delete_items"
end
