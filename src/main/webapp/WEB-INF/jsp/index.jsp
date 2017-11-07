#
<%@ page import="homepage.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
Massively by HTML5 UP
html5up.net | @ajlkn
Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>Massively by HTML5 UP</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="assets/css/noscript.css"/>
    </noscript>
</head>

<body class="is-loading">

<!-- Wrapper -->
<div id="wrapper" class="fade-in">

    <!-- Intro -->
    <div id="intro">
        <h1>This is<br/>
            Massively</h1>
        <p>A free, fully responsive HTML5 + CSS3 site template designed by <a
                href="https://twitter.com/ajlkn">@ajlkn</a> for <a href="https://html5up.net">HTML5 UP</a><br/>
            and released for free under the <a href="https://html5up.net/license">Creative Commons license</a>.</p>
        <ul class="actions">
            <li><a href="#header" class="button icon solo fa-arrow-down scrolly">Continue</a></li>
        </ul>
    </div>

    <!-- Header -->
    <header id="header">
        <a href="/index.action" class="logo">Massively</a>
    </header>

    <!-- Nav -->
    <%@ include file="nav.jsp" %>

    <!-- Main -->
    <div id="main">

        <!-- Featured Post -->
        <article class="post featured">
            <header class="major">
                <span class="date">April 25, 2017</span>
                <h2><a href="#">Home Page<br/>
                    Spring Boot</a></h2>
                <p>Home Page</p>
            </header>
            <a href="#" class="image main"><img src="images/pic01.jpg" alt=""/></a>
            <ul class="actions">
                <li><a href="#" class="button big">Full Story</a></li>
            </ul>
        </article>


        <!-- Posts -->
        <section class="posts">


            <%
                ArrayList<Article> list = (ArrayList<Article>) request.getAttribute("list");
                String pageNum = request.getQueryString();
                int pages;
                if (pageNum == null) {
                    pages = 1;
                } else {
                    pages = Integer.parseInt(pageNum);
                }


            %>
            <%
                if (list.size() - (pages - 1) * 4 < 4) {
                    for (int j = list.size() - (pages - 1) * 4; j > 0; j--) {
            %>
            <article>
                <header>
                    <span class="date"><%=list.get(j - 1).getCreatedAt()%></span>
                    <h2><a href="/gallery.action?articleNum=<%=list.get(j-1).getId()%>"><%=list.get(j - 1).getTitle()%>
                    </a></h2>
                </header>
                <a href="/gallery.action?articleNum=<%=list.get(j-1).getId()%>" class="image fit"><img src="/image.action?<%=list.get(j - 1).getSaveName()%>" alt=""/></a>
                <p><%=list.get(j - 1).getContent()%>
                </p>
                <ul class="actions">
                    <li><a href="#" class="button">Full Story</a></li>
                </ul>
            </article>

            <%
                }
            %>
            <%
            } else {
                for (int k = list.size() - (pages - 1) * 4; k > list.size() - (pages - 1) * 4 - 4; k--) {
            %>
            <article>
                <header>
                    <span class="date"><%=list.get(k - 1).getCreatedAt()%></span>
                    <h2><a href="/gallery.action?articleNum=<%=list.get(k-1).getId()%>"><%=list.get(k - 1).getTitle()%>
                    </a></h2>
                </header>
                <a href="/gallery.action?articleNum=<%=list.get(k-1).getId()%>" class="image fit"><img src="/image.action?<%=list.get(k - 1).getSaveName()%>" alt=""/></a>
                <p><%=list.get(k - 1).getContent()%>
                </p>
                <ul class="actions">
                    <li><a href="#" class="button">Full Story</a></li>
                </ul>
            </article>
            <%
                    }
                }
            %>

            <c:if test="${list.size() eq 0}">
                <article>

                </article>
            </c:if>

        </section>

        <!-- Footer -->
        <footer>
            <div class="pagination">
                <!--<a href="#" class="previous">Prev</a>-->
                <%
                    int lastPage;
                    if (list.size() % 4 == 0) {
                        lastPage = list.size() / 4;
                    } else {
                        lastPage = list.size() / 4 + 1;
                    }

                    if (pages == 1) {
                %>

                <a href="/index.action?1" class="page active">1
                </a>
                <a href="/index.action?2" class="page">2
                </a>
                <a href="/index.action?3" class="page">3
                </a>
                <span class="extra">&hellip;</span>
                <a href="/index.action?<%=list.size() / 4 - 2%>" class="page"><%=list.size() / 4 - 2%>
                </a>
                <a href="/index.action?<%=list.size() / 4 - 1%>" class="page"><%=list.size() / 4 - 1%>
                </a>
                <a href="/index.action?<%=list.size() / 4%>" class="page"><%=list.size() / 4%>
                </a>
                <%


                } else if (list.size() / 4 + 1 > 10 && !(pages <= lastPage - 2 || pages == lastPage - 1 || pages == lastPage || pages > lastPage || pages != 1) || pages <= lastPage / 2) {
                %>


                <a href="/index.action?<%=pages-1%>" class="page"><%=pages - 1%>
                </a>
                <a href="/index.action?<%=pages%>" class="page active"><%=pages%>
                </a>
                <a href="/index.action?<%=pages+1%>" class="page"><%=pages + 1%>
                </a>
                <span class="extra">&hellip;</span>
                <a href="/index.action?<%=lastPage- 2 %>" class="page"><%=lastPage - 2%>
                </a>
                <a href="/index.action?<%=lastPage - 1%>" class="page"><%=lastPage - 1%>
                </a>
                <a href="/index.action?<%=lastPage%>" class="page"><%=lastPage%>
                </a>


                <%
                    }
                    if (pages == lastPage - 1 || pages == lastPage) {

                %>

                <%
                    if (pages == lastPage) {
                %>
                <a href="/index.action?1" class="page">1
                </a>
                <a href="/index.action?2" class="page">2
                </a>
                <a href="/index.action?3" class="page">3
                </a>
                <span class="extra">&hellip;</span>
                <a href="/index.action?<%=lastPage - 2%>" class="page"><%=lastPage - 2%>
                </a>
                <a href="/index.action?<%=lastPage - 1%>" class="page"><%=lastPage - 1%>
                </a>
                <a href="/index.action?<%=lastPage%>" class="page active"><%=lastPage%>
                </a>

                <%
                    }
                    if (pages == lastPage - 1) {
                %>
                <a href="/index.action?1" class="page">1
                </a>
                <a href="/index.action?2" class="page">2
                </a>
                <a href="/index.action?3" class="page">3
                </a>
                <span class="extra">&hellip;</span>
                <a href="/index.action?<%=lastPage - 2%>" class="page"><%=lastPage - 2%>
                </a>
                <a href="/index.action?<%=lastPage - 1%>" class="page active"><%=lastPage - 1%>
                </a>
                <a href="/index.action?<%=lastPage%>" class="page"><%=lastPage%>
                </a>
                <%
                        }
                    }
                    if (pages > lastPage || pages < 1) { %>
                <script>
                    location.href = "/error.action";
                </script>
                <%
                    }
//                else{
//                    for (int i = 0; i < list.size(); i = i + 4) {
                    if (pages <= lastPage - 2 && pages > lastPage / 2) {
                %>
                <a href="/index.action?1" class="page">1
                </a>
                <a href="/index.action?2" class="page">2
                </a>
                <a href="/index.action?3" class="page">3
                </a>
                <span class="extra">&hellip;</span>
                <a href="/index.action?<%=pages - 1%>" class="page"><%=pages - 1%>
                </a>
                <a href="/index.action?<%=pages%>" class="page active"><%=pages%>
                </a>
                <a href="/index.action?<%=pages + 1%>" class="page"><%=pages + 1%>
                </a>


                <%--<a href="/index.action?<%=i / 4 + 1%>" class="page active"><%=i / 4 + 1%>--%>
                <%--</a>--%>
                <%
                    }

                    //                        }
//                    }

                %>


                <%--<a href="#" class="page active">1</a>--%>
                <%--<a href="#" class="page">2</a>--%>
                <%--<a href="#" class="page">3</a>--%>
                <%--<span class="extra">&hellip;</span>--%>
                <%--<a href="#" class="page">8</a>--%>
                <%--<a href="#" class="page">9</a>--%>
                <%--<a href="#" class="page">10</a>--%>
                <%--<a href="#" class="next">Next</a>--%>
            </div>
        </footer>

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