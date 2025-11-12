<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Reservation System</title>
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
            width: 400px;
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

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 15px;
        }

        button {
            background-color: #007bff;
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
            background-color: #0056b3;
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
        <h1>Search Flights</h1>
        <form action="search.jsp" method="get">
            <label for="source">Source:</label>
            <input type="text" name="source" id="source" required>

            <label for="destination">Destination:</label>
            <input type="text" name="destination" id="destination" required>

            <label for="date">Date (YYYY-MM-DD):</label>
            <input type="date" name="date" id="date" required>

            <button type="submit">Search Flights</button>
        </form>

        <a href="admin.jsp">Admin Page</a>
    </div>
</body>
</html>
