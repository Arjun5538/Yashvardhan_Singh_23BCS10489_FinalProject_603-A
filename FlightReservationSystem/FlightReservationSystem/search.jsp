<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // --- Reset XML if session is new (fresh start every time) ---
    if (session.isNew()) {
        String xmlPath = application.getRealPath("/data/flights.xml");
        try {
            File xmlFile = new File(xmlPath);
            if (xmlFile.exists()) {
                xmlFile.delete();
                xmlFile.createNewFile();
                FileWriter writer = new FileWriter(xmlFile);
                writer.write("<flights></flights>");
                writer.close();
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error resetting flight data: " + e.getMessage() + "</h3>");
        }
    }
%>
<html>
<head>
    <title>Search Flights</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            text-align: center;
            padding-top: 50px;
        }
        table {
            width: 85%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        h2 {
            color: #333;
        }
        a {
            background-color: #28a745;
            color: white;
            padding: 5px 12px;
            border-radius: 4px;
            text-decoration: none;
        }
        a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<h2>Search Results</h2>

<%
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String date = request.getParameter("date");

    String filePath = application.getRealPath("/data/flights.xml");
    File xmlFile = new File(filePath);

    if (!xmlFile.exists() || xmlFile.length() == 0) {
        out.println("<h3 style='color:red;'>No flight data available. Please add flights first.</h3>");
    } else {
        try {
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();

            NodeList nList = doc.getElementsByTagName("flight");
            boolean found = false;

            out.println("<table>");
            out.println("<tr><th>ID</th><th>Source</th><th>Destination</th><th>Date</th><th>Seats</th><th>Price (INR)</th><th>Book</th></tr>");

            Set<String> uniqueFlights = new HashSet<>(); // avoid duplicates

            for (int i = 0; i < nList.getLength(); i++) {
                Node node = nList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element e = (Element) node;

                    // Read ID (attribute or tag)
                    String id = e.getAttribute("id");
                    if (id == null || id.trim().isEmpty()) {
                        Node idNode = e.getElementsByTagName("id").item(0);
                        if (idNode != null) id = idNode.getTextContent();
                    }

                    String src = e.getElementsByTagName("source").item(0).getTextContent();
                    String dest = e.getElementsByTagName("destination").item(0).getTextContent();
                    String d = e.getElementsByTagName("date").item(0).getTextContent();

                    // Read seats and price
                    String seats = "";
                    String price = "";
                    if (e.getElementsByTagName("availableSeats").getLength() > 0)
                        seats = e.getElementsByTagName("availableSeats").item(0).getTextContent();
                    else if (e.getElementsByTagName("seats").getLength() > 0)
                        seats = e.getElementsByTagName("seats").item(0).getTextContent();

                    if (e.getElementsByTagName("price").getLength() > 0)
                        price = e.getElementsByTagName("price").item(0).getTextContent();
                    else if (e.getElementsByTagName("fare").getLength() > 0)
                        price = e.getElementsByTagName("fare").item(0).getTextContent();

                    // Match search
                    if (src.equalsIgnoreCase(source) && dest.equalsIgnoreCase(destination) && d.equals(date)) {
                        String key = id + src + dest + d;
                        if (!uniqueFlights.contains(key)) {
                            uniqueFlights.add(key);
                            found = true;
                            out.println("<tr>");
                            out.println("<td>" + id + "</td>");
                            out.println("<td>" + src + "</td>");
                            out.println("<td>" + dest + "</td>");
                            out.println("<td>" + d + "</td>");
                            out.println("<td>" + seats + "</td>");
                            out.println("<td>" + price + "</td>");
                            out.println("<td><a href='confirm.jsp?id=" + id + "&source=" + src + "&destination=" + dest + "&date=" + d + "&price=" + price + "'>Book</a></td>");
                            out.println("</tr>");
                        }
                    }
                }
            }

            out.println("</table>");
            if (!found)
                out.println("<h3 style='color:red;'>No flights found.</h3>");

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error reading flight data: " + e.getMessage() + "</h3>");
        }
    }
%>

</body>
</html>
