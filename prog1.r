#list of products available in store
all_products<-list(
  list(name="Apple",price=0.5),
  list(name="Banana",price=1.8),
  list(name="Carrot",price=1.6),
  list(name="Milk",price=2)
)

cat(sprintf("list of products available in store\n"))
cat(sprintf("Name \t Price\n"))
for( i in all_products)
{
  cat(sprintf("%s \t %s\n",i$name,i$price))
}

#shopping cart
shopping_cart<-list()

#define products to buy
cart_items_to_add<-list(
  list(name="Apple",quantity=3),
  list(name="Milk",quantity=4),
  list(name="Carrot",quantity=5),
  list(name="Bread",quantity=7)
)

#add items to shopping cart if its available 
for(item in cart_items_to_add)
{
  p_name<-item$name
  qnty<-item$quantity
  product<-NULL
  for(p in all_products)
  {
    if(p$name==p_name)
    {
      product<-p
      break
    }
  }


#if product is avaolable add to sdhopping cart
if(!is.null(product))
{
  cart_item=list(name=product$name,price=product$price,quantity=qnty)
  shopping_cart<-append(shopping_cart,list(cart_item))
  cat("item added to cart\n")
}else
  {
  cat("item not found")
  }

}

#calculate and display receipt
subtotal<-0
cat("\nRECEIPT\n")
for(item in shopping_cart)
{
  item_subtotal<-item$price * item$quantity
  cat(sprintf("%s(%d units)-Price:$%.2f-Subtotal:$%.2f\n",item$name,item$quantity,item$price,item_subtotal))
  subtotal<-subtotal+item_subtotal
}

tax_rate<-0.18
tax_amount<-tax_rate*subtotal
total_cost<-subtotal*tax_amount
cat(sprintf("total amount before tax:$%.2f\n",subtotal))
cat(sprintf("total amount after tax:$%.2f\n",total_cost))
