<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Careers - Ghampey Shoes Pasal"); %>
<jsp:include page="/pages/header.jsp" />

<!-- HEADER -->
<section class="header-section">
    <h1>Join the <span>Team</span></h1>
    <p>We are looking for passionate shoe enthusiasts, coders, and runners to help us scale Nepal's premium footwear brand.</p>
</section>

<!-- CAREERS CONTENT -->
<section class="container careers-container">
    <h2>Current Open Positions</h2>
    <p class="intro">At Ghampey Shoes Pasal, we believe in passion, humor, and top-tier craftsmanship. Work with Dhiraj, Sachin, Shreshkar, and the rest of our crew to create and deliver amazing shoes. Enjoy a workspace overlooking Lakeside Pokhara, all the black tea you can drink, and a free pair of Ghampeys every year.</p>

    <div class="job-list">
        <!-- Job 1: fit tester -->
        <div class="job-card">
            <div class="job-header">
                <div class="job-title">Shoe Fit & QA Tester</div>
                <div class="job-location">Pokhara, Nepal</div>
            </div>
            <p class="job-desc">Work directly under Shreshkar Gurung to walk, run, and slide in our prototype shoes until they break. You'll help us identify weak points in stitching, soles, and materials before shoes go to final production.</p>
            <div class="job-requirements">
                <h4>Key Requirements</h4>
                <ul>
                    <li>Possess naturally destructive feet (destroys shoes within weeks).</li>
                    <li>Willingness to run after Pokhara local buses on a daily basis.</li>
                    <li>High pain tolerance for when proto-shoes don't fit quite right.</li>
                </ul>
            </div>
        </div>

        <!-- Job 2: designer -->
        <div class="job-card">
            <div class="job-header">
                <div class="job-title">Junior Footwear Designer</div>
                <div class="job-location">Pokhara, Nepal</div>
            </div>
            <p class="job-desc">Collaborate with Sachin Gurung to sketch, prototype, and render the next generation of Ghampey Sneaker designs. You'll merge modern streetwear design with Nepalese craftsmanship.</p>
            <div class="job-requirements">
                <h4>Key Requirements</h4>
                <ul>
                    <li>Proficient in Illustrator, Photoshop, or 3D Footwear modeling software.</li>
                    <li>Strong understanding of hiking boot dynamics and urban streetwear trends.</li>
                    <li>Understanding that shoe laces should, in fact, stay on top of the shoe.</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Apply Box -->
    <div class="apply-box">
        <h3>How to Apply</h3>
        <p>Send your portfolio, CV, and a funny 100-word paragraph on why you deserve a pair of Ghampey Shoes to careers@ghampey.com.</p>
        <a href="<%= request.getContextPath() %>/pages/contact.jsp?subject=Careers Inquiry" class="apply-btn">Inquire via Contact Form</a>
    </div>
</section>

<jsp:include page="/pages/footer.jsp" />
