package com.example.frs;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.util.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;

public class FlightSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/search.jsp").forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String source = req.getParameter("source");
        String dest = req.getParameter("destination");
        String date = req.getParameter("date");
        // Very simple XML parsing of data/flights.xml
        List<String> results = new ArrayList<>();
        try {
            File f = new File(getServletContext().getRealPath("/data/flights.xml"));
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(f);
            NodeList flights = doc.getElementsByTagName("flight");
            for (int i=0;i<flights.getLength();i++) {
                Element fl = (Element)flights.item(i);
                String s = fl.getElementsByTagName("source").item(0).getTextContent();
                String d = fl.getElementsByTagName("destination").item(0).getTextContent();
                String dt = fl.getElementsByTagName("date").item(0).getTextContent();
                String id = fl.getAttribute("id");
                String seats = fl.getElementsByTagName("availableSeats").item(0).getTextContent();
                if (s.equalsIgnoreCase(source) && d.equalsIgnoreCase(dest) && dt.equals(date)) {
                    results.add(id + " | " + s + " -> " + d + " | " + dt + " | seats:" + seats);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("results", results);
        req.getRequestDispatcher("/search.jsp").forward(req, resp);
    }
}
