extends Control

var entry = preload("res://entry.tscn")
var account_titles = []

func _ready() -> void:
	$Journal/AddEntry.pressed.connect(add_entry)
	$Journal/Collect.pressed.connect(collect_info)

func add_entry():
	var new_entry = entry.instantiate()
	$Journal/JournalScroll/VBoxContainer.add_child(new_entry)

func to_ledger(entries):
	for ent in entries:
		#print("TEST: ", ent.debit_title)
		if !account_titles.has(ent.debit_title.to_upper()):
			account_titles.append(ent.debit_title.to_upper())
		elif ent.debit_title == "":
			pass
			
		if !account_titles.has(ent.credit_title.to_upper()):
			account_titles.append(ent.credit_title.to_upper())
		elif ent.credit_title == "":
			pass
			
	print(account_titles)

func collect_info():
	var entries = $Journal/JournalScroll/VBoxContainer.get_children()
	var all_entries = []
	for current_entry in entries:
		#print(current_entry.request_information())
		all_entries.append(current_entry.request_information())
	#print(all_entries)
	to_ledger(all_entries)
	return all_entries
