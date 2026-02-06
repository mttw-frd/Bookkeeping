extends Panel

func _ready() -> void:
	$CreditValue.text_changed.connect(check_value)
	$DebitValue.text_changed.connect(check_value)
	$Remove.pressed.connect(remove_entry)
	%VatCheck.toggled.connect(apply_vat)
	return

func remove_entry():
	queue_free()

func check_value(_value):
	if $CreditValue.text == $DebitValue.text:
		print("Credit and Debit are Balanced")
		return
	else:
		print("Credit and Debit are not Balanced")
	
func request_information():
	var info = {
		"credit_title" : $CreditAccTitle.text,
		"debit_title" : $DebitAccTitle.text,
		
		"credit_value" : $CreditValue.text,
		"debit_value" : $DebitValue.text
	}
	return info

func _on_option_button_pressed() -> void:
	$OptionButton/Options.visible = !$OptionButton/Options.visible
	pass # Replace with function body.

func apply_vat(_toggled: bool):
	print("VAT TEST")
	print(int($DebitValue.text) / 1.12)
	var vat_exclusive = int($DebitValue.text) / 1.12
	var vat_value = int($DebitValue.text) - vat_exclusive
	
	$DebitValue.text = str(vat_exclusive)
	print(vat_value)
	print(snapped(vat_value, 0.01))
