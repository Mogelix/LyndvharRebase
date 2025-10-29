/datum/anvil_recipe
	abstract_type = /datum/anvil_recipe
	var/name
	var/category = "Misc"
	var/list/additional_items = list()
	var/material_quality = 0 // Quality of the bar(s) used. Accumulated per added ingot.
	var/num_of_materials = 1 // Total number of materials used. Quality divided among them.
	var/skill_quality = 0 // Accumulated per hit based on calculations, will decide final result.
	var/appro_skill = /datum/skill/craft/blacksmithing
	var/atom/req_bar
	var/atom/req_blade
	var/using_blade = FALSE
	var/atom/movable/created_item
	var/createditem_num = 1 // How many units to make.
	var/craftdiff = 0
	var/needed_item
	var/needed_item_text
	var/quality_mod = 0
	var/progress
	var/max_progress = 100
	var/i_type
	var/bar_health = 100 // Current material bar health, reduced by failures. At 0 HP it is deleted.
	var/numberofhits = 0 // Increased every time you hit the bar, the more you have to hit the bar the less quality of the product.
	var/numberofbreakthroughs = 0 // How many good hits we got on the metal, advances recipes 50% faster, reduces number of hits total, and restores bar_health
	var/datum/parent

/datum/anvil_recipe/New(datum/P, using_blade = FALSE, ...)
	. = ..()

/datum/anvil_recipe/proc/show_menu(mob/user)
	user << browse(generate_html(user),"window=new_recipe;size=500x810")

/datum/anvil_recipe/proc/generate_html(mob/user)
	var/client/client = user
	if(!istype(client))
		client = user.client
	user << browse_rsc('html/book.png')
	var/html = {"
		<!DOCTYPE html>
		<html lang="en">
		<meta charset='UTF-8'>
		<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'/>
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
		<body>
		  <div>
		    <h1>[name]</h1>
		"}

	if(craftdiff > 0)
		html += "For those of [SSskills.level_names_plain[craftdiff]] skills<br>"
	else
		html += "Suitable for all skills<br>"

	if(appro_skill == /datum/skill/craft/engineering) // SNOWFLAKE!!!
		html += "in Engineering<br>"

	html += {"<div>
		      <strong>Requirements</strong>
			  <br>"}

	html += "[icon2html(new req_bar, user)] Start with [initial(req_bar.name)] on an anvil.<br>"
	html += "Hammer the material.<br>"
	for(var/atom/path as anything in additional_items)
		html += "[icon2html(new path, user)] then add [initial(path.name)]<br>"
		html += "Hammer the material.<br>"
	html += "<br>"

	html += {"
		</div>
		<div>
		"}

	if(createditem_num > 1)
		html += "<strong class=class='scroll'>and then you get</strong> <br> [createditem_num] [icon2html(new created_item, user)] <br> [initial(created_item.name)]<br>"
	else
		html += "<strong class=class='scroll'>and then you get</strong> <br> [icon2html(new created_item, user)] <br> [initial(created_item.name)]<br>"

	if(created_item.sellprice)
		html += "<strong class=class='scroll'>You can sell this for [created_item.sellprice] mammons at a normal quality</strong> <br>"
	else
		html += "<strong class=class='scroll'>This is worthless for export</strong> <br>"

	html += {"
		</div>
		</div>
	</body>
	</html>
	"}
	return html
