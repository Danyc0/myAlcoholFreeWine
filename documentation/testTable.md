Test Table for My Alcohol Free Wine
===================================

Test Name                   | Test Description                              | Inputs  | Expected Result
----------------------------|-----------------------------------------------|---------|---------------------------------------
find wines                  | Show that the controller works with the model | None    | Returns some wines
show all wines              | Show that the wines get routed properly       | None    | Returns all the wines
find wines called awine     | Show that the model can be searched           | None    | Returns just wines which match "awine"
add to basket               | Show that the controller can add to the basket| None    | The basket gains an element
clear basket                | Show that the basket can be cleared           | A Basket| The basket is cleared
check checkout clears basket| Show that checkout clears the basked          | A Basket| The basket is cleared
