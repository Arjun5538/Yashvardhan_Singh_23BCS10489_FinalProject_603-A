<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*, org.xml.sax.*" %>
<%@ page import="javax.xml.transform.*, javax.xml.transform.dom.DOMSource, javax.xml.transform.stream.StreamResult" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flight Added</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 80px;
            background-color: #f2f2f2;
        }
        h2 {
            color: green;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String date = request.getParameter("date");
    String seats = request.getParameter("seats");
    String price = request.getParameter("price");

    String filePath = application.getRealPath("/data/flights.xml");

    try {
        File xmlFile = new File(filePath);
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        Document doc;

        if (xmlFile.exists()) {
            doc = dBuilder.parse(xmlFile);
        } else {
            doc = dBuilder.newDocument();
            Element root = doc.createElement("flights");
            doc.appendChild(root);
        }

        Element root = doc.getDocumentElement();

        Element flight = doc.createElement("flight");
        flight.setAttribute("id", id);

        Element src = doc.createElement("source");
        src.appendChild(doc.createTextNode(source));
        flight.appendChild(src);

        Element dest = doc.createElement("destination");
        dest.appendChild(doc.createTextNode(destination));
        flight.appendChild(dest);

        Element d = doc.createElement("date");
        d.appendChild(doc.createTextNode(date));
        flight.appendChild(d);

        Element s = doc.createElement("availableSeats");
        s.appendChild(doc.createTextNode(seats));
        flight.appendChild(s);

        Element p = doc.createElement("price");
        p.appendChild(doc.createTextNode(price));
        flight.appendChild(p);

        root.appendChild(flight);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        DOMSource sourceDom = new DOMSource(doc);
        StreamResult result = new StreamResult(xmlFile);
        transformer.transform(sourceDom, result);

        out.println("<h2>✅ Flight Added Successfully!</h2>");
        out.println("<a href='admin.jsp'>Add Another Flight</a><br>");
        out.println("<a href='search.jsp'>Go to Search Page</a>");
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error while adding flight: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
</body>
</html>
