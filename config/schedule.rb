#Job to automate the delete_items task
 every :hour do
   rake "todo:delete_items"
 end
