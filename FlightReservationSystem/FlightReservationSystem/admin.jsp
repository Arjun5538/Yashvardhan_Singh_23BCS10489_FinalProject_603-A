<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Add Flight</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
            width: 420px;
            padding: 30px;
            text-align: center;
        }

        h1 {
            font-size: 22px;
            color: #222;
            margin-bottom: 25px;
            font-weight: 600;
        }

        label {
            display: block;
            font-weight: 500;
            margin: 10px 0 5px;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 15px;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 0;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.3s;
        }

        button:hover {
            background-color: #1f8d3c;
        }

        a {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Admin - Add Flight</h1>
        <form action="addFlight.jsp" method="post">
            <label>Flight ID:</label>
            <input type="text" name="id" required>

            <label>Source:</label>
            <input type="text" name="source" required>

            <label>Destination:</label>
            <input type="text" name="destination" required>

            <label>Date (YYYY-MM-DD):</label>
            <input type="date" name="date" required>

            <label>Available Seats:</label>
            <input type="number" name="availableSeats" required>

            <label>Price (INR):</label>
            <input type="number" name="price" required>

            <button type="submit">Add Flight</button>
        </form>

        <a href="index.jsp">Go to Homepage</a>
    </div>
</body>
</html>
