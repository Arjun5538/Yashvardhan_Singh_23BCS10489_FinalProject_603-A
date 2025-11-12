<%@ page import="javax.xml.parsers.*,org.w3c.dom.*,javax.xml.transform.*,javax.xml.transform.dom.DOMSource,javax.xml.transform.stream.StreamResult,java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Add Flight</title>
</head>
<body>
<h2>Admin - Add Flight</h2>

<form method="post" action="admin_add.jsp">
    Flight ID: <input type="text" name="id" required><br><br>
    Source: <input type="text" name="source" required><br><br>
    Destination: <input type="text" name="destination" required><br><br>
    Date (YYYY-MM-DD): <input type="text" name="date" required><br><br>
    Available Seats: <input type="number" name="seats" required><br><br>
    Price (INR): <input type="number" name="fare" required><br><br>
    <input type="submit" value="Add Flight">
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String id = request.getParameter("id");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");
        String seats = request.getParameter("seats");
        String fare = request.getParameter("fare");

        String filePath = application.getRealPath("/data/flights.xml");
        File xmlFile = new File(filePath);

        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc;

            if (xmlFile.exists() && xmlFile.length() > 0) {
                doc = builder.parse(xmlFile);
                doc.getDocumentElement().normalize();
            } else {
                doc = builder.newDocument();
                Element root = doc.createElement("flights");
                doc.appendChild(root);
            }

            Element root = doc.getDocumentElement();
            Element flight = doc.createElement("flight");

            Element eId = doc.createElement("id");
            eId.appendChild(doc.createTextNode(id));
            flight.appendChild(eId);

            Element eSource = doc.createElement("source");
            eSource.appendChild(doc.createTextNode(source));
            flight.appendChild(eSource);

            Element eDestination = doc.createElement("destination");
            eDestination.appendChild(doc.createTextNode(destination));
            flight.appendChild(eDestination);

            Element eDate = doc.createElement("date");
            eDate.appendChild(doc.createTextNode(date));
            flight.appendChild(eDate);

            Element eSeats = doc.createElement("seats");
            eSeats.appendChild(doc.createTextNode(seats));
            flight.appendChild(eSeats);

            Element eFare = doc.createElement("fare");
            eFare.appendChild(doc.createTextNode(fare));
            flight.appendChild(eFare);

            root.appendChild(flight);

            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.transform(new DOMSource(doc), new StreamResult(xmlFile));

            out.println("<p style='color:green;'>Flight added successfully.</p>");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error adding flight: " + e.getMessage() + "</p>");
        }
    }
%>

<p><a href="index.jsp">Back to Home</a></p>
</body>
</html>