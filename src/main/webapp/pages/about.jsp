<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Our Story - Ghampey Shoes Pasal"); %>
<jsp:include page="/pages/header.jsp" />

<!-- HEADER -->
<section class="header-section">
    <h1>Our <span>Story</span></h1>
    <p>How six friends from Pokhara went from slipping down mountains to launching Nepal's premium footwear empire.</p>
</section>

<!-- STORY CONTENT -->
<section class="container story-content">
    <div class="story-text">
        <h2>It Started with a Slip</h2>
        <p>Ghampey Shoes Pasal wasn't born in a corporate boardroom. It was born on a muddy hiking trail in Sarangkot, where cheap soles gave out, dignity was lost, and a vision was found. We set out on a mission: to create durable, high-quality, and stunning shoes that represent the style and spirit of Nepal. Today, we craft Pokhara's finest footwear, delivering comfort and attitude across the nation.</p>
    </div>

    <h2 class="team-title">The Starters of Ghampey</h2>
    
    <div class="team-grid">
        <!-- Dhiraj Dhungana -->
        <div class="team-card">
            <div class="avatar-wrap">DD</div>
            <div class="team-name">Dhiraj Dhungana</div>
            <div class="team-role">CEO & Mastermind</div>
            <div class="team-bio">Dhiraj started Ghampey after slipping on a hike and rolling 200 meters down a hill. Covered in mud but enlightened, he declared: "No Nepalese shall suffer bad soles again!" He handles strategic vision (i.e. drinking tea and pointing at shoe sketches).</div>
        </div>

        <!-- Sachin Gurung -->
        <div class="team-card">
            <div class="avatar-wrap">SG</div>
            <div class="team-name">Sachin Gurung</div>
            <div class="team-role">Head of Design</div>
            <div class="team-bio">Sachin spent three weeks meditating on the curves of a hiking boot in the Annapurna range, only to realize he put the laces on the bottom. He designs all Ghampey models, ensuring every shoe looks like it can run at 100km/h.</div>
        </div>

        <!-- Shreshkar Gurung -->
        <div class="team-card">
            <div class="avatar-wrap">SG</div>
            <div class="team-name">Shreshkar Gurung</div>
            <div class="team-role">Head of QA & Fit Testing</div>
            <div class="team-bio">Shreshkar has destroyed 50 pairs of shoes in a single year just by walking normally. Now he heads testing: if a shoe survives Shreshkar running to catch a Pokhara local bus, it's certified "Ghampey Proof".</div>
        </div>

        <!-- Aayush Gurung -->
        <div class="team-card">
            <div class="avatar-wrap">AG</div>
            <div class="team-name">Aayush Gurung</div>
            <div class="team-role">Customer Happiness Lead</div>
            <div class="team-bio">Aayush can tell your shoe size just by hearing you walk. He joined Ghampey after trying to return a pair of boots from 2018 claiming they "didn't match his aura." Now, he manages returns and keeps customers laughing.</div>
        </div>

        <!-- Kushal Palikhe -->
        <div class="team-card">
            <div class="avatar-wrap">KP</div>
            <div class="team-name">Kushal Palikhe</div>
            <div class="team-role">Chief Shipping Officer</div>
            <div class="team-bio">Kushal once ran a half-marathon holding a shoe box because he forgot to pack a delivery van. He treats every shipment like an Olympic sprint, ensuring your shoes arrive in record time.</div>
        </div>

        <!-- Ashrik Kayastha -->
        <div class="team-card">
            <div class="avatar-wrap">AK</div>
            <div class="team-name">Ashrik Kayastha</div>
            <div class="team-role">Chief Technology Officer</div>
            <div class="team-bio">Ashrik was found trying to build an app that automatically ties shoelaces via Bluetooth. While the app tripped several beta-testers, his database and web coding wizardry keep Ghampey Shoes online and responsive.</div>
        </div>
    </div>
</section>

<jsp:include page="/pages/footer.jsp" />
