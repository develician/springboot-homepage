<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
Massively by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>Elements Reference - Massively by HTML5 UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="assets/css/noscript.css"/>
    </noscript>
</head>
<body class="is-loading">
<c:choose>
<c:when test="${not empty sessionScope.memberLoginInfo}">
    <c:redirect url="/index.action"/>
</c:when>
    <c:otherwise>
        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header -->
            <header id="header">
                <a href="index.html" class="logo">Massively</a>
            </header>

            <%@ include file="nav.jsp"%>

            <!-- Main -->
            <div id="main">


                <!-- Form -->
                <h2>Join</h2>

                <form method="post" action="/join.action" class="alt">
                    <div class="row uniform">
                        <div class="12u 12u$(xsmall)">
                            <input type="text" name="userID" id="demo-userID" value="" placeholder="ID"/>
                        </div>
                        <div class="6u 12u$(xsmall)">
                            <input type="password" name="userPassword1" id="demo-password1" value="" placeholder="Password"/>
                        </div>
                        <div class="6u 12u$(xsmall)">
                            <input type="password" name="userPassword2" id="demo-password2" value=""
                                   placeholder="Check Password"/>
                        </div>
                        <div class="12u 12u$(xsmall)">
                            <input type="text" name="userEmail" id="demo-userEmail" value="" placeholder="Email"/>
                        </div>

                        <!-- Break -->


                        <div class="4u 12u$(xsmall)">

                            <div class="select-wrapper">
                                <select name="userYear" id="userYear">
                                    <%
                                        for (int i = 2017; i > 1930; i--) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <div class="4u 12u$(xsmall)">
                            <div class="select-wrapper">
                                <select name="userMonth" id="userMonth">
                                    <%
                                        for (int i = 12; i > 0; i--) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="4u 12u$(xsmall)">
                            <div class="select-wrapper">
                                <select name="userDay" id="userDay">
                                    <%
                                        for (int i = 31; i > 0; i--) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Break -->
                        <div class="4u 12u$(small)">
                            <input type="radio" id="demo-priority-low" name="userGender" checked>
                            <label for="demo-priority-low">Man</label>
                        </div>
                        <div class="4u 12u$(small)">
                            <input type="radio" id="demo-priority-normal" name="userGender">
                            <label for="demo-priority-normal">Woman</label>
                        </div>
                            <%--<div class="4u$ 12u$(small)">--%>
                            <%--<input type="radio" id="demo-priority-high" name="demo-priority">--%>
                            <%--<label for="demo-priority-high">High</label>--%>
                            <%--</div>--%>
                        <!-- Break -->
                            <%--<div class="6u 12u$(small)">--%>
                            <%--<input type="checkbox" id="demo-copy" name="demo-copy">--%>
                            <%--<label for="demo-copy">Student</label>--%>
                            <%--</div>--%>
                            <%--<div class="6u$ 12u$(small)">--%>
                            <%--<input type="checkbox" id="demo-human" name="demo-human" checked>--%>
                            <%--<label for="demo-human">C</label>--%>
                            <%--</div>--%>
                        <!-- Break -->
                            <%--<div class="12u$">--%>
                            <%--<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>--%>
                            <%--</div>--%>
                        <!-- Break -->
                        <div class="12u$">
                            <ul class="actions">
                                <li><input type="submit" value="JOIN" class="special"/></li>
                                <li><input type="reset" value="Reset"/></li>
                            </ul>
                        </div>
                    </div>
                </form>

                <hr/>


            </div>

            <!-- Footer -->
            <footer id="footer">
                <section>
                    <form method="post" action="#">
                        <div class="field">
                            <label for="name">Name</label>
                            <input type="text" name="name" id="name"/>
                        </div>
                        <div class="field">
                            <label for="email">Email</label>
                            <input type="text" name="email" id="email"/>
                        </div>
                        <div class="field">
                            <label for="message">Message</label>
                            <textarea name="message" id="message" rows="3"></textarea>
                        </div>
                        <ul class="actions">
                            <li><input type="submit" value="Send Message"/></li>
                        </ul>
                    </form>
                </section>
                <section class="split contact">
                    <section class="alt">
                        <h3>Address</h3>
                        <p>1234 Somewhere Road #87257<br/>
                            Nashville, TN 00000-0000</p>
                    </section>
                    <section>
                        <h3>Phone</h3>
                        <p><a href="#">(000) 000-0000</a></p>
                    </section>
                    <section>
                        <h3>Email</h3>
                        <p><a href="#">info@untitled.tld</a></p>
                    </section>
                    <section>
                        <h3>Social</h3>
                        <ul class="icons alt">
                            <li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
                            <li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
                        </ul>
                    </section>
                </section>
            </footer>

            <!-- Copyright -->
            <div id="copyright">
                <ul>
                    <li>&copy; Untitled</li>
                    <li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
                </ul>
            </div>

        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

        </body>
        </html>
    </c:otherwise>
</c:choose>

