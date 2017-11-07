<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav id="nav">
    <ul class="links">
        <%
            if (request.getRequestURI().contains("join.jsp")) {
        %>
        <c:choose>
            <c:when test="${not empty sessionScope.memberLoginInfo}">
                <li class="active"><a href="/gallery.action">Gallery</a></li>
                <li><a href="/index.action">This is Massively</a></li>
                <li><a href="/logout.action">Logout</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="/index.action">This is Massively</a></li>
                <li><a href="/gallery.action">Gallery</a></li>
                <li class="active"><a href="/join.action">Join</a></li>
                <li><a href="/login.action">Login</a></li>

            </c:otherwise>
        </c:choose>

        <%
            }
            if (request.getRequestURI().contains("index.jsp")) {
        %>
        <c:choose>
            <c:when test="${not empty sessionScope.memberLoginInfo}">
                <li class="active"><a href="/index.action">This is Massively</a></li>
                <li><a href="/gallery.action">Gallery</a></li>
                <li><a href="/logout.action">Logout</a></li>
            </c:when>
            <c:otherwise>
                <li class="active"><a href="/index.action">This is Massively</a></li>
                <li><a href="/gallery.action">Gallery</a></li>
                <li><a href="/join.action">Join</a></li>
                <li><a href="/login.action">Login</a></li>
            </c:otherwise>
        </c:choose>

        <%
            }
            if (request.getRequestURI().contains("gallery.jsp")) {
        %>
        <c:choose>
            <c:when test="${not empty sessionScope.memberLoginInfo}">
                <li><a href="/index.action">This is Massively</a></li>
                <li class="active"><a href="/gallery.action">Gallery</a></li>
                <li><a href="/logout.action">Logout</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="/index.action">This is Massively</a></li>
                <li class="active"><a href="/gallery.action">Gallery</a></li>
                <li><a href="/join.action">Join</a></li>
                <li><a href="/login.action">Login</a></li>
            </c:otherwise>
        </c:choose>

        <%
            }
            if (request.getRequestURI().contains("login.jsp")) {
        %>
        <c:choose>
            <c:when test="${not empty sessionScope.memberLoginInfo}">
                <li><a href="/index.action">This is Massively</a></li>
                <li><a href="/gallery.action">Gallery</a></li>
                <li><a href="/logout.action">Logout</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="/index.action">This is Massively</a></li>
                <li><a href="/gallery.action">Gallery</a></li>
                <li><a href="/join.action">Join</a></li>
                <li class="active"><a href="/login.action">Login</a></li>
            </c:otherwise>
        </c:choose>

        <%
            }
        %>

    </ul>
    <ul class="icons">

        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
        <li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
    </ul>
</nav>