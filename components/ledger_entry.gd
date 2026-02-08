extends Panel

@onready var IsDebit = false

func apply_debit(entry):
	#print("Debitted")
	IsDebit = true
	$Date.text = entry.date
	$Credit.text = ""
	$Debit.text = str(entry.debit_value)
	$Debit.text = str(entry.debit_value)
	
func apply_credit(entry):
	#print("Credited")
	$Date.text = entry.date
	$Debit.text = ""
	$Credit.text = str(entry.credit_value)
	$Credit.text = str(entry.credit_value)

func get_info():
	var info = {
		"date" : $Date.text,
		"debit_value" : $Debit.text,
		"credit_value" : $Credit.text,
	}
	return info

func apply_balance(balance):
	$Balance.text = str(balance)

func get_balance():
	return $Balance.text
