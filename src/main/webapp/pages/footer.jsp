<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String localIp = "localhost";
    try {
        java.util.Enumeration<java.net.NetworkInterface> interfaces = java.net.NetworkInterface.getNetworkInterfaces();
        boolean found = false;
        while (interfaces.hasMoreElements() && !found) {
            java.net.NetworkInterface iface = interfaces.nextElement();
            // Skip loopbacks, virtual network interfaces, and inactive ones
            if (iface.isLoopback() || !iface.isUp() || iface.getDisplayName().toLowerCase().contains("virtual") || iface.getName().toLowerCase().contains("vbox")) {
                continue;
            }
            java.util.Enumeration<java.net.InetAddress> addresses = iface.getInetAddresses();
            while (addresses.hasMoreElements()) {
                java.net.InetAddress addr = addresses.nextElement();
                if (addr instanceof java.net.Inet4Address) {
                    String ip = addr.getHostAddress();
                    if (!ip.startsWith("127.") && !ip.startsWith("169.254")) { // Exclude loopback and link-local address
                        localIp = ip;
                        found = true;
                        break;
                    }
                }
            }
        }
        // Fallback if not found on interfaces
        if ("localhost".equals(localIp)) {
            localIp = java.net.InetAddress.getLocalHost().getHostAddress();
        }
    } catch (Exception e) {
        localIp = "127.0.0.1";
    }
    
    int serverPort = request.getServerPort();
    String scheme = request.getScheme();
    String contextPath = request.getContextPath();
    // Reconstruct the exact LAN URL
    String phoneUrl = scheme + "://" + localIp + ":" + serverPort + contextPath + "/HomeServlet";
%>

<!-- FOOTER -->
<footer>
    <div class="footer-grid">
        <div class="footer-brand">
            <a href="<%= request.getContextPath() %>/HomeServlet" class="nav-logo" style="color:white;">Ghampey <span>SHOES PASAL</span></a>
            <p>Nepal's premium destination for authentic footwear. Based in Pokhara, delivering excellence across the country.</p>
        </div>
        <div class="footer-col">
            <h4>Shop</h4>
            <ul>
                <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Men">Men's Shoes</a></li>
                <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Women">Women's Shoes</a></li>
                <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Kids">Kids' Shoes</a></li>
                <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Sale">Sale</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Help</h4>
            <ul>
                <li><a href="<%= request.getContextPath() %>/OrderStatusServlet">Order Status</a></li>
                <li><a href="<%= request.getContextPath() %>/ReturnsServlet">Returns</a></li>
                <li><a href="<%= request.getContextPath() %>/SizeGuideServlet">Size Guide</a></li>
                <li><a href="<%= request.getContextPath() %>/ContactServlet">Contact Us</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>About</h4>
            <ul>
                <li><a href="<%= request.getContextPath() %>/AboutServlet">Our Story</a></li>
                <li><a href="<%= request.getContextPath() %>/CareersServlet">Careers</a></li>
                <li><a href="<%= request.getContextPath() %>/PrivacyServlet">Privacy Policy</a></li>
                <li><a href="<%= request.getContextPath() %>/TermsServlet">Terms of Use</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2026 Ghampey Shoes Pasal. All Rights Reserved.</p>
        <p>Pokhara, Nepal</p>
    </div>
</footer>

<!-- FLOATING ACCESSIBILITY WIDGET (DESKTOP ONLY) -->
<button type="button" class="phone-widget-btn" id="phone-widget-trigger">
    <span>📱</span> Access on Phone
</button>

<!-- PHONE ACCESS MODAL -->
<div class="phone-modal" id="phone-modal">
    <div class="phone-modal-content">
        <button type="button" class="phone-modal-close" id="phone-modal-close">×</button>
        <h3 style="font-size:20px; font-weight:800; margin-bottom:12px;">📱 Open on Your Phone</h3>
        <p style="font-size:14px; color:#555; line-height:1.5;">Connect your mobile phone and computer to the same Wi-Fi network, then scan this QR code:</p>
        
        <div class="qr-code-img">
            <!-- QR Code using standard free API -->
            <img src="https://api.qrserver.com/v1/create-qr-code/?size=160x160&data=<%= java.net.URLEncoder.encode(phoneUrl, "UTF-8") %>" alt="Scan to open on phone" width="160" height="160">
        </div>
        
        <p style="font-size:13px; color:#777; margin-bottom:6px;">Or enter this URL in your mobile browser:</p>
        <div class="phone-url-box">
            <%= phoneUrl %>
        </div>
        <p style="font-size:11px; color:#999; font-style:italic;">Make sure your local firewall allows connection on port <%= serverPort %></p>
    </div>
</div>

<!-- SCRIPTS -->
<script>
    // Hamburger Drawer Interaction
    document.addEventListener("DOMContentLoaded", function() {
        const hamburgerBtn = document.getElementById("hamburger-btn");
        const mobileDrawer = document.getElementById("mobile-drawer");
        const drawerBackdrop = document.getElementById("drawer-backdrop");

        if (hamburgerBtn && mobileDrawer && drawerBackdrop) {
            function toggleDrawer() {
                hamburgerBtn.innerText = mobileDrawer.classList.contains("active") ? "☰" : "✕";
                mobileDrawer.classList.toggle("active");
                drawerBackdrop.classList.toggle("active");
            }

            hamburgerBtn.addEventListener("click", toggleDrawer);
            drawerBackdrop.addEventListener("click", toggleDrawer);
        }

        // Phone Access Widget Modal Interaction
        const widgetTrigger = document.getElementById("phone-widget-trigger");
        const phoneModal = document.getElementById("phone-modal");
        const modalClose = document.getElementById("phone-modal-close");

        if (widgetTrigger && phoneModal && modalClose) {
            widgetTrigger.addEventListener("click", function() {
                phoneModal.classList.add("active");
            });

            modalClose.addEventListener("click", function() {
                phoneModal.classList.remove("active");
            });

            phoneModal.addEventListener("click", function(e) {
                if (e.target === phoneModal) {
                    phoneModal.classList.remove("active");
                }
            });
        }
    });
</script>

</body>
</html>
