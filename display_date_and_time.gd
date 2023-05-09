extends Control

#First step is to make these variables.
#Time variable setup.
var time = Time.get_datetime_dict_from_system()
var nameweekday= ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
var namemonth= ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
var dayofweek = time["weekday"]   # from 0 to 6 --> Sunday to Saturday
var day = time["day"]                         #   1-31
var month= time["month"]               #   1-12
var year= time["year"]             
var hour= time["hour"]                     #   0-23
var minute= time["minute"]             #   0-59
var second= time["second"]             #   0-59

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#Second step is to tell them to make a virtual method for this.
func _process(delta):
	
	$DisplayPanel/Date.text = str(nameweekday[dayofweek]) + " of " + str(namemonth[month-1]) + " " + str(Time.get_datetime_dict_from_system()["day"]) + ", " + str(Time.get_datetime_dict_from_system()["year"])
	
	if Time.get_datetime_dict_from_system()["hour"]-12 > 0:
		#12PM - 11PM
		$DisplayPanel/Time.text =  str(Time.get_datetime_dict_from_system()["hour"]-12) + ":" + str("%02d" % [Time.get_datetime_dict_from_system()["minute"]]) + ":" + str("%02d" % [Time.get_datetime_dict_from_system()["second"]]) + "PM"
		pass
	else:
		if Time.get_datetime_dict_from_system()["hour"] == 0: #12AM
			$DisplayPanel/Time.text =  "12" + ":" + str("%02d" % [Time.get_datetime_dict_from_system()["minute"]]) + ":" + str("%02d" % [Time.get_datetime_dict_from_system()["second"]]) + "AM"
		else: #1-11AM
			$DisplayPanel/Time.text =  str(Time.get_datetime_dict_from_system()["hour"]) + ":" + str("%02d" % [Time.get_datetime_dict_from_system()["minute"]]) + ":" + str("%02d" % [Time.get_datetime_dict_from_system()["second"]]) + "AM"
			pass
		pass
	
	pass
