<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*, javax.xml.transform.*, javax.xml.transform.dom.DOMSource, javax.xml.transform.stream.StreamResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Booking</title>
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
        <h1>Confirm Booking</h1>
        <form action="success.jsp" method="post">
            <input type="hidden" name="flightId" value="<%= request.getParameter("id") %>">

            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Seats to Book:</label>
            <input type="number" name="seats" required min="1">

            <button type="submit">Confirm Booking</button>
        </form>

        <a href="index.jsp">Back to Search</a>
    </div>
</body>
</html>
