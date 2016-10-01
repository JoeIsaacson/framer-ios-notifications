# Module Import
myModule = require "basicModule"

# Color Vars
white = 	new Color("#ffffff")
offWhite = 	new Color("#f2f2f2")
faintGrey = new Color("#CCCCCC")
lightGrey = new Color("#2D3339")
grey = 		new Color("#24282D")
darkGrey = 	new Color("#13161A")
red = 		new Color("#F80046")

# Set Canvas color
Canvas.backgroundColor = red

# Set background color
Screen.backgroundColor = white

# Heigh Vars
topNavHeight = 100
bottomNavHeight = 150
bodyHeight = Screen.height - (topNavHeight)

# Create Body
body = new Layer
	width: Screen.width
	height: bodyHeight
	x: 0
	y: Align.top(topNavHeight)

# print Screen.width

# Create ScrollComponent
scroll = new ScrollComponent
	parent: body
	width: Screen.width
	height: bodyHeight
	backgroundColor: offWhite
	scrollHorizontal: false

# Add inset to the ScrollComponent
scroll.contentInset = 
	top: 20
	bottom: 20

# Top Nav
topNav = new Layer
	width: Screen.width
	height: topNavHeight
	x: 0
	y: 0
	backgroundColor: red
topNav.states.add
	highlighted:
		backgroundColor: red
	
navHeader = new Layer
	parent: topNav
	width: 230
	height: 29
	x: Align.center
	y: Align.center
	html: "Notifications"
	backgroundColor: red
	style: 
		"text-align": "center",
		"font-size": "40px",
		"font-weight": "600"
	
# Bottom Nav
bottomNav = new Layer
	width: screen.width
	height: bottomNavHeight
	y: Align.bottom
	backgroundColor: grey
	borderColor: red
	borderWidth: 1	
	visible: false
	
# Define the width of list item
itemWidth = Screen.width - 40

notificationsArray = [0,1,2,3,4,5]

# Create six layers in a loop
for notificationCard in notificationsArray
	# notification card
	card = new Layer
		parent: scroll.content
		name: "row_#{notificationCard}"
		id: notificationCard
		width: itemWidth
		height: 340
		x: 20
		y: 360 * notificationCard
		backgroundColor: white
# 		shadowX: 0
# 		shadowY: 1
# 		shadowBlur: 2
# 		shadowSpread: 1
# 		shadowColor: faintGrey
		borderColor: faintGrey
		borderWidth: 1
		borderRadius: 7
	
	# artist image	
	cardImage = new Layer
		parent: card
		width: 100
		height: 100
		x: 20
		y: 40
		borderRadius: 50
		content: "whatever"
		color: "#333"
		image: "images/chance.jpg"
		z: 1
	
	# notification details	
	cardContent = new Layer
		parent: card
		html: "<h4>Chance the Rapper</h4><p>Wednesday 24 		Aug 2016. 02, Shepard's Bush Empire, London</p>"
		color: grey
		style: 
			"padding": "25px 20px",
			"vertical-align" : "middle",
			"line-height": 1.4
		width: (itemWidth-130)
		height: 200
		backgroundColor: white
		x: Align.right(-4)
		z: 0	
		
	# card actions	
	cardActions = new Layer
		parent: card
		height: 170
		y: Align.bottom(-3)
		width: itemWidth-3
		backgroundColor: white
		
	# buy button		
	buyButton = new Layer
		parent: cardActions
		backgroundColor: white
		width: itemWidth-3
		height: 80
		x: Align.center
		y: Align.bottom()
		color: "#00AE20"
		html: "Buy tickets"
		style: 
			"text-align": "center",
			"padding": "25px",
			"text-transform": "uppercase",
			"font-weight": "600"
			"border-top": "1px solid #bbb"
	buyButton.states.add 
		selected:
			backgroundColor: "#fff"

	# event timing
	eventTiming = new Layer
		parent: cardActions
		height: 80
		width: 355
		x: Align.left(10)
		y: Align.top
		backgroundColor: white
		html: "21h · Just announced"
		color: "#666"
		style: 
			"padding": "25px 10px",
			"font-weight": "600",
			"font-size": "24px"
			"text-align": "center"

# 	print itemWidth

	#rigthSection
	rightSection = new Layer
		parent: cardActions
		height: 80
		width: 355
		x: Align.right(-10)
		backgroundColor: white

	#track button
	trackButton = new Layer
		parent: rightSection
		height: 80
		width: 285
		x: Align.center
		y: Align.top
		backgroundColor: white
		html: "Tracking event"
		color: red
		style: 
			"padding": "25px 10px 25px 60px",
			"font-weight": "600",
			"font-size": "24px",
			"text-align": "center",
			"text-transform": "uppercase"
			
	trackIcon = new Layer
		parent: trackButton
		width: 35
		height: 35
		borderRadius: 20
		borderColor: lightGrey
		backgroundColor: white
		borderWidth: 3
		x: 0
		y: Align.center				
	# State Changes
	trackIcon.states.add
		empty:
			borderColor: grey			
		selected:
			borderColor: red			
	#Change state changes
	trackButton.onTap ->
		# Fire switch of states	
		print this.children	
		#selectedIcon.states.next()