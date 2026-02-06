extends Control

var entry = preload("res://entry.tscn")

func _ready() -> void:
	$AddEntry.pressed.connect(add_entry)
	$Collect.pressed.connect(collect_info)

func add_entry():
	var new_entry = entry.instantiate()
	$JournalScroll/VBoxContainer.add_child(new_entry)

func to_ledger(entries):
	for ent in entries:
		print(ent.debit_title)

func collect_info():
	var entries = $JournalScroll/VBoxContainer.get_children()
	var all_entries = []
	for current_entry in entries:
		#print(current_entry.request_information())
		all_entries.append(current_entry.request_information())
	print(all_entries)
	to_ledger(all_entries)
	return all_entries
