<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=MS949" isErrorPage="true" %>
<center>
<table width="60%" height="60%">
    <tr><td align="center">
<pre>
err: ${requestScope['javax.servlet.error.status_code']}
message: <%= exception.getMessage() %>
referer: ${header['referer']}

</pre>
<a href="javascript:history.back()">µÚ·Î</a>
    </td></tr>
</table>
</center>
