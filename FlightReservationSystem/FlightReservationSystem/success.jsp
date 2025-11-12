<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*, javax.xml.transform.*, javax.xml.transform.dom.DOMSource, javax.xml.transform.stream.StreamResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Successful</title>
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

        .card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.1);
            width: 420px;
            padding: 40px;
            text-align: center;
            animation: fadeIn 0.5s ease-in;
        }

        h1 {
            font-size: 24px;
            color: #28a745;
            margin-bottom: 10px;
            font-weight: 600;
        }

        p {
            color: #333;
            font-size: 16px;
            margin: 8px 0;
        }

        .btn {
            display: inline-block;
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
            text-decoration: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="card">
        <%
            String flightId = request.getParameter("flightId");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String seatsBooked = request.getParameter("seats");

            // Store booking info in bookings.xml
            try {
                String filePath = application.getRealPath("data/bookings.xml");
                File xmlFile = new File(filePath);

                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                Document doc;
                Element root;

                if (xmlFile.exists()) {
                    doc = dBuilder.parse(xmlFile);
                    root = doc.getDocumentElement();
                } else {
                    doc = dBuilder.newDocument();
                    root = doc.createElement("bookings");
                    doc.appendChild(root);
                }

                Element booking = doc.createElement("booking");

                Element fid = doc.createElement("flightId");
                fid.appendChild(doc.createTextNode(flightId));
                booking.appendChild(fid);

                Element uname = doc.createElement("name");
                uname.appendChild(doc.createTextNode(name));
                booking.appendChild(uname);

                Element uemail = doc.createElement("email");
                uemail.appendChild(doc.createTextNode(email));
                booking.appendChild(uemail);

                Element useats = doc.createElement("seats");
                useats.appendChild(doc.createTextNode(seatsBooked));
                booking.appendChild(useats);

                root.appendChild(booking);

                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                DOMSource source = new DOMSource(doc);
                StreamResult result = new StreamResult(xmlFile);
                transformer.transform(source, result);
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error saving booking: " + e.getMessage() + "</p>");
            }
        %>

        <h1>Booking Confirmed!</h1>
        <p><strong>Passenger:</strong> <%= name %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>Flight ID:</strong> <%= flightId %></p>
        <p><strong>Seats Booked:</strong> <%= seatsBooked %></p>
        <br>
        <a href="index.jsp" class="btn">Back to Home</a>
    </div>
</body>
</html>
