<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Flight</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url("C:\tomcat9\webapps\FlightReservationSystem\images\airport-terminal.jpg") no-repeat center center/cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.92);
            padding: 40px;
            border-radius: 15px;
            width: 420px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #1a237e;
            margin-bottom: 25px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-top: 10px;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
            font-size: 15px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #1a73e8;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            margin-top: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #0d47a1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Book Your Flight</h1>
        <form action="confirm.jsp" method="post">
            <input type="hidden" name="flightId" value="<%= request.getParameter("flightId") %>">

            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Age:</label>
            <input type="number" name="age" required>

            <label>Seats to Book:</label>
            <input type="number" name="seats" required min="1">

            <button type="submit">Confirm Booking</button>
        </form>
    </div>
</body>
</html>
