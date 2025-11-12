package com.example.frs;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;
import java.util.UUID;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String flightId = req.getParameter("flightId");
        String name = req.getParameter("name");
        String contact = req.getParameter("contact");
        String idNo = req.getParameter("idno");
        String seatClass = req.getParameter("class");
        String bookingId = "BK" + UUID.randomUUID().toString().substring(0,8).toUpperCase();

        try {
            String dataPath = getServletContext().getRealPath("/data/bookings.xml");
            File f = new File(dataPath);
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc;
            Element root;
            if (!f.exists()) {
                doc = db.newDocument();
                root = doc.createElement("bookings");
                doc.appendChild(root);
            } else {
                doc = db.parse(f);
                root = doc.getDocumentElement();
            }
            Element b = doc.createElement("booking");
            b.setAttribute("id", bookingId);
            Element fn = doc.createElement("flightId"); fn.setTextContent(flightId); b.appendChild(fn);
            Element pn = doc.createElement("passengerName"); pn.setTextContent(name); b.appendChild(pn);
            Element pc = doc.createElement("contact"); pc.setTextContent(contact); b.appendChild(pc);
            Element pid = doc.createElement("idNo"); pid.setTextContent(idNo); b.appendChild(pid);
            Element cls = doc.createElement("class"); cls.setTextContent(seatClass); b.appendChild(cls);
            root.appendChild(b);

            // save
            Transformer t = TransformerFactory.newInstance().newTransformer();
            t.setOutputProperty(OutputKeys.INDENT, "yes");
            t.transform(new DOMSource(doc), new StreamResult(f));
            req.setAttribute("bookingId", bookingId);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Booking failed: " + e.getMessage());
        }
        req.getRequestDispatcher("/confirm.jsp").forward(req, resp);
    }
}
