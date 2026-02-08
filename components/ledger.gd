extends Panel

var entry = preload("res://components/ledger_entry.tscn")
@export var Ledger_Title = ""

func change_title(title):
	Ledger_Title = title
	$AccTitle.text = title

func compute_entry():
	var all_entries = $Scroll/VBox.get_children()
	var old_balance = 0
	for i in all_entries.size():
		var entry_info = all_entries[i].get_info()
		print(entry_info)
		#old_balance = int(all_entries[i].get_balance())
		
		if entry_info.IsDebit:
			old_balance = old_balance + float(entry_info.debit_value)
		else:
			old_balance = old_balance + (float(entry_info.credit_value) * -1)
			
		all_entries[i].apply_balance(old_balance)
		
		

func _enter_tree() -> void:
	for entries in GLOBAL.journal_entries:
		#print(entries)
		if Ledger_Title == entries.debit_title:
			#print("TEST ENTRY:")
			#print(entries)
			var new_entry = entry.instantiate()
			new_entry.apply_debit(entries)
			$Scroll/VBox.add_child(new_entry)
			
		if $AccTitle.text == entries.credit_title:
			var new_entry = entry.instantiate()
			new_entry.apply_credit(entries)
			$Scroll/VBox.add_child(new_entry)
		
	compute_entry()
