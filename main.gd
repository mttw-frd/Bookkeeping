extends Control

var journal_entry = preload("res://components/journal_entry.tscn")
var ledger_entry = preload("res://components/ledger.tscn")
var account_titles = []

func _ready() -> void:
	$Journal/AddEntry.pressed.connect(add_entry)
	$Journal/Collect.pressed.connect(collect_info)

func add_entry():
	var new_entry = journal_entry.instantiate()
	$Journal/JournalScroll/VBoxContainer.add_child(new_entry)

func to_ledger(entries):
	
	if $Ledger/ScrollContainer/VBoxContainer.get_child_count() == 0:
		pass
	else:
		var all_ledger = $Ledger/ScrollContainer/VBoxContainer.get_children()
		for ledger in all_ledger:
			$Ledger/ScrollContainer/VBoxContainer.remove_child(ledger)
			
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
			
	for title in account_titles:
		var new_entry = ledger_entry.instantiate()
		new_entry.change_title(title)
		$Ledger/ScrollContainer/VBoxContainer.add_child(new_entry)
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
