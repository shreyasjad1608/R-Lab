inventory_items<-character(0)
inventory_quantities<-numeric(0)
print(class(inventory_items))
#function to add new item into list
add_item<-function(item,quantity)
{
  #<<- used to update global variable
  inventory_items<<-c(inventory_items,item)
  inventory_quantities<<-c(inventory_quantities,quantity)
  cat("Item added to inventory\n")
}

update_quantity<-function(item,new_quantity){
  if(item %in% inventory_items){
    item_index<-which(item==inventory_items)
    inventory_items[item_index]<<-new_quantity
    cat("Quantity updated\n")
  }
  else{
    cat("quantity not found\n")
  }
}

remove_item<-function(item,quantity){
  if(item %in% inventory_items){
    item_index<-which(item==inventory_items)
    inventory_items<<-inventory_items[-item_index]
    inventory_quantities<<-inventory_quantities[-item_index]
  }
  else{
    cat("item not found")
  }
}

display_itemns<-function()
{
  cat("Inventory items and quantities\n")
  for (i in 1:length(inventory_items)){
    cat(sprintf("%s:%d\n",inventory_items[i],inventory_quantities[i]))
  }
}

#main program
while(TRUE)
{
  cat("1.add item\n2.update item\n3.display item\n4.Remove quantity\n5.exit")
  choice=as.integer(readline("enter choice\n"))
  
  if(choice==1){
    item=readline("enter item\n")
    quantity=as.integer(readline("enter quantity\n"))
    add_item(item,quantity)
  }
  else if(choice==2){
    item=readline("enter item to be updated\n")
    new_quantity=as.integer(readline("enter new quantity\n"))
    update_quantity(item,new_quantity)
  }
  else if(choice==3){
    display_itemns()
  }
  else if(choice==4){
    item=readline("enter item to be removed\n")
    new_quantity=as.integer(readline("enter  quantity\n"))
    remove_item(item,new_quantity)
    
  }
  else if(choice==5){
    break
  }
  else{
    cat("invalid choice enetered")
  }
  }
  



