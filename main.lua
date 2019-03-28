-----------------------------------------------------------------------------------------
-- March 23, 2019
-- main.lua
-- Created by: Marlon Poddalgoda
-----------------------------------------------------------------------------------------

display.setDefault( "background", 47/255, 97/255, 214/255 )
--text
local myText = display.newText( "Pizza Calculator", 160, -20, native.systemFont, 40 )
myText:setFillColor( 255/255, 29/255, 96/255 )

local myText = display.newText( "By: Marlon", 56, 20, native.systemFont, 17 )
myText:setFillColor( 6/255, 29/255, 96/255 )

local myText = display.newText( "Pizza Size", 95, 60, native.systemFont, 30 )
myText:setFillColor( 247/255, 146/255, 0/255 )

local myText = display.newText( "Number of Toppings", 160, 150, native.systemFont, 30 )
myText:setFillColor( 247/255, 146/255, 0/255 )

local myText = display.newText( "Cost", 160, 372, native.systemFont, 25 )
myText:setFillColor( 0/255, 0/255, 0/255 )

--images
local image = display.newImageRect( "assets/line.png", 400, 120 )
image.x = 160
image.y = 360

local image = display.newImageRect( "assets/pizza.png", 50, 40 )
image.x = 140
image.y = 20

local image = display.newImageRect( "assets/pizza.png", 50, 40 )
image.x = 200
image.y = 20

local image = display.newImageRect( "assets/pizza.png", 50, 40 )
image.x = 260
image.y = 20

--------------------------toppings buttons (assets)---------------------------------
--Order button
local pizzaButton = display.newImageRect( "./assets/order.png", 250, 250 )
pizzaButton.x = 160
pizzaButton.y = 310
pizzaButton.id = "Order button"

--largepizza
local pizzaButton1 = display.newImageRect( "./assets/1top.png", 110, 25 )
pizzaButton1.x = 90
pizzaButton1.y = 200
pizzaButton1.id = "1 Topping"

local pizzaButton2 = display.newImageRect( "./assets/2top.png", 110, 25 )
pizzaButton2.x = 230
pizzaButton2.y = 200
pizzaButton2.id = "2 Topping"

local pizzaButton3 = display.newImageRect( "./assets/3top.png", 110, 25 )
pizzaButton3.x = 90
pizzaButton3.y = 250
pizzaButton3.id = "3 Topping"

local pizzaButton4 = display.newImageRect( "./assets/4top.png", 110, 25 )
pizzaButton4.x = 230
pizzaButton4.y = 250
pizzaButton4.id = "4 Topping"

--size
local pizzaButton5 = display.newImageRect( "./assets/lgpizza.png", 110, 25 )
pizzaButton5.x = 90
pizzaButton5.y = 103
pizzaButton5.id = "Large pizza"

local pizzaButton6 = display.newImageRect( "./assets/xlpizza.png", 110, 25 )
pizzaButton6.x = 230
pizzaButton6.y = 103
pizzaButton6.id = "Extra large pizza"

--cost textfields

local subtotalOfpizzaTextfield = display.newText( "Subtotal is...", display.contentCenterX, display.contentCenterY + 160, native.systemFont, 23 )
subtotalOfpizzaTextfield.id = "Subtotal textField"
subtotalOfpizzaTextfield:setFillColor (100/255, 200/255, 77/255)

local taxOfpizzaTextfield = display.newText( "Tax is...", display.contentCenterX, display.contentCenterY + 190, native.systemFont, 23 )
taxOfpizzaTextfield.id = "Tax textField"
taxOfpizzaTextfield:setFillColor (100/255, 200/255, 77/255)

local totalOfpizzaTextfield = display.newText( "Total is...", display.contentCenterX, display.contentCenterY + 230, native.systemFont, 30 )
totalOfpizzaTextfield.id = "Total textField"
totalOfpizzaTextfield:setFillColor (255/255, 255/255, 0/255)

--set variables
sizeOfPizza = 0
costOfPizza = 0
numberOfToppings = 0
subtotalOfpizza = 0
taxOfpizza = 0

--functions of buttons
function pizzaButton5Touch ( event )
	sizeOfPizza = 6
	print "Large Pizza on order"
	return true
end

function pizzaButton6Touch ( event )
	sizeOfPizza = 10
	print "XL Pizza on order"
end

function pizzaButton1Touch ( event )
	numberOfToppings = 1
	print "1 topping on pizza!"
end

function pizzaButton2Touch ( event )
	numberOfToppings = 1.75
	print "2 toppings on pizza!"
end

function pizzaButton3Touch ( event )
	numberOfToppings = 2.50
	print "3 toppings on pizza!"
end

function pizzaButton4Touch ( event )
	numberOfToppings = 3.35
	print "4 toppings on pizza!"
end

--functions cost
function pizzaButtonTouch ( event )
	subtotalOfpizza = (sizeOfPizza + numberOfToppings)
	subtotalOfpizzaTextfield.text = "Subtotal is $" .. subtotalOfpizza
	taxOfpizza = (subtotalOfpizza * 0.13)
	roundtax = math.floor(taxOfpizza * (10^2) + 0.5) / (10^2)
	taxOfpizzaTextfield.text = "Tax(13%) is $" .. roundtax
	costOfPizza = (subtotalOfpizza * 1.13)
	roundcost = math.floor(costOfPizza * (10^2) + 0.5) / (10^2)
	totalOfpizzaTextfield.text = "Total is $" .. roundcost
	print "Order requested, pizza is being baked"
end

pizzaButton:addEventListener( "touch", pizzaButtonTouch )

pizzaButton1:addEventListener( "touch", pizzaButton1Touch )

pizzaButton2:addEventListener( "touch", pizzaButton2Touch )

pizzaButton3:addEventListener( "touch", pizzaButton3Touch )

pizzaButton4:addEventListener( "touch", pizzaButton4Touch )

pizzaButton5:addEventListener( "touch", pizzaButton5Touch )

pizzaButton6:addEventListener( "touch", pizzaButton6Touch )