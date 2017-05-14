<!DOCTYPE html>
<html lang="en">
<head>
<title>Choose your payment option</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Choose how to pay</h2>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#creditcard">Credit
					Card</a></li>
			<li><a data-toggle="tab" href="#debitcard">Debit Card</a></li>
			<li><a data-toggle="tab" href="#paypal">PayPal</a></li>
			<li><a data-toggle="tab" href="#netbanking">Netbanking</a></li>
			<li><a data-toggle="tab" href="#cod">Cash On Delivery</a></li>
			<li><a data-toggle="tab" href="#emi">EMI</a></li>
			<li><a data-toggle="tab" href="#giftvoucher">Gift Voucher</a></li>
		</ul>

		<div class="tab-content">
			<div id="creditcard" class="tab-pane fade in active">
				<h3>Credit Card</h3>
				<br>
				<p>Please select credit card you want to use to pay for this
					order.</p>
				<select name=""selectcreditcard">
					<option>--Select--</option>
					<option>Visa Credit Card</option>
					<option>MasterCard Credit Card</option>
					<option>American Express</option>
					<option>Diners Club Card</option>
				</select> <br> <br> <br> <br> <br>
				<p>
					<b>Note</b>: Use this option for credit cards issued in <b>India</b>.
				</p>
			</div>
			<div id="debitcard" class="tab-pane fade">
				<h3>Debit Card</h3>
				<p>Please select debit card you want to use to pay for this
					order.</p>

				<select name=""selectdebitcard">
					<option>--Select--</option>
					<option>Visa Debit Card issued in India(All banks)</option>
					<option>MasterCard Debit Card issued in India(All banks)</option>
					<option>Maestro Debit Card</option>
					<option>VisaElectronic Debit Card</option>
				</select>

			</div>
			<div id="paypal" class="tab-pane fade">
				<h3>Click on the button below to pay using paypal</h3>
				<img src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif">
			</div>
			<div id="netbanking" class="tab-pane fade">
				<h3>Net Banking</h3>
				<p>Please select name of the bank from the drop down list below</p>
				<select name="selectnetbanking">
					<option value="">Select</option>
					<option value="34" id="payment_method_34">State Bank of
						India</option>
					<option value="16" id="payment_method_16">HDFC Bank</option>
					<option value="17" id="payment_method_17">ICICI Bank</option>
					<option value="2" id="payment_method_2">AXIS Bank</option>
					<option value="85" id="payment_method_85">Allahabad Bank</option>
					<option value="4" id="payment_method_4">Bank of Baroda
						Corporate Accounts</option>
					<option value="5" id="payment_method_5">Bank of Baroda
						Retail Accounts</option>
					<option value="6" id="payment_method_6">Bank of India</option>
					<option value="7" id="payment_method_7">Bank of
						Maharashtra</option>
					<option value="79" id="payment_method_79">Canara Bank</option>
					<option value="9" id="payment_method_9">Central Bank of
						India</option>
					<option value="10" id="payment_method_10">Citibank Bank
						Account Online</option>
					<option value="11" id="payment_method_11">City Union Bank</option>
					<option value="14" id="payment_method_14">Deutsche Bank</option>
					<option value="91" id="payment_method_91">Dhanlakshmi Bank</option>
					<option value="15" id="payment_method_15">Federal Bank</option>
					<option value="18" id="payment_method_18">IDBI Bank</option>
					<option value="75" id="payment_method_75">Indian Bank</option>
					<option value="19" id="payment_method_19">Indian Overseas
						Bank</option>
					<option value="20" id="payment_method_20">IndusInd Bank</option>
					<option value="25" id="payment_method_25">Kotak Mahindra
						Bank</option>
					<option value="27" id="payment_method_27">Oriental Bank of
						Commerce</option>
					<option value="28" id="payment_method_28">Punjab National
						Bank Corporate Accounts</option>
					<option value="29" id="payment_method_29">Punjab National
						Bank Retail Accounts</option>
					<option value="32" id="payment_method_32">Standard
						Chartered Bank</option>
					<option value="77" id="payment_method_77">State Bank of
						Bikaner and Jaipur</option>
					<option value="37" id="payment_method_37">Syndicate Bank</option>
					<option value="39" id="payment_method_39">Union Bank of
						India</option>
					<option value="41" id="payment_method_41">Vijaya Bank</option>
					<option value="42" id="payment_method_42">YES Bank</option>
					<option >UCO Bank</option>
				</select>
			</div>
			<div id="cod" class="tab-pane fade">
				<h3>Cash On Delivery</h3>
				<p>Please click on the button below to select Cash on Delivery.</p>

				<input type="radio" checked="checked" /> I agree to pay Cash for
				this order when this order is delivered to me.
			</div>
			<div id="emi" class="tab-pane fade">
				<h3>EMI</h3>
				<p>
					Please select the <b>credit card</b> you want to use for EMI.
				</p>

				<select name="seelectemi">
					<option>--Select--</option>
					<option>Axis Bank</option>
					<option>Citibank</option>
					<option>HDFC Bank</option>
					<option>HSBC</option>
					<option>ICICI Bank</option>
					<option>Kotak Mahindra Bank</option>
					<option>SBI</option>
					<option>Standard Chartered</option>

				</select> <br>
				<br>
				<br>
				<br>
				<p>
					<b>Note</b>: (1) If you cancel your EMI order, the EMI Interest
					Amount charged will not be refunded.
				</p>
				<p>* Installment amount has been rounded to next higher rupee.</p>
			</div>
			<div id="giftvoucher" class="tab-pane fade">
				<h3>Gift Vouchers</h3>
				<input type="text" name="giftcard" placeholder="Enter your code">
				 <button type="button" class="btn btn-primary">Apply</button>
		</div>
	</div>

</body>
</html>
