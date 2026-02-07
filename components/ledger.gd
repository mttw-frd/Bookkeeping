extends Panel

var entry = preload("res://components/ledger_entry.tscn")
@export var Ledger_Title = ""

func change_title(title):
	Ledger_Title = title
	$AccTitle.text = title

func compute_entry():
	var all_entries = $Scroll/VBox.get_children()

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
