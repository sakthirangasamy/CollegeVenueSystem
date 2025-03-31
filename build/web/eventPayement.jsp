<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <style>
     
        
        h2 {
            color: #333;
            text-align: center;
            margin-top: 30px;
        }

        .container {
            width: 40%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }

        label {
            font-size: 16px;
            color: #555;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        .alert {
            color: red;
            font-size: 16px;
            text-align: center;
            margin-top: 20px;
        }

        .footer {
            text-align: center;
            /*margin-top: 30px;*/
            color: #888;
        }
    </style>

    <script type="text/javascript">
        function validateAmount() {
            var amount = document.getElementById("amount").value;
            if (parseFloat(amount) > 100000) {
                alert("Amount cannot exceed 1 lakh (100,000). Please enter a valid amount.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>
<body>

    <jsp:include page="uhome.jsp"/>

    <div class="container">
        <h2>Complete Payment</h2>

        <form action="processPayment.jsp" method="post" onsubmit="return validateAmount()">
            <label for="booking_id">Booking ID:</label>
            <input type="text" name="booking_id" id="booking_id" required><br><br>
            
            <label for="amount">Amount:</label>
            <input type="number" name="amount" id="amount" step="0.01" required><br><br>
            
            <label for="payment_status">Payment Status:</label>
            <select name="payment_status" id="payment_status" required>
                <option value="pending">Pending</option>
                <option value="paid">Paid</option>
            </select><br><br>

            <button type="submit">Make Payment</button>
        </form>
    </div>

    
    
</body>
</html>
