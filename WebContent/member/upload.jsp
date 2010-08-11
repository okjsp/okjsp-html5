<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.BufferedReader"%>
<% System.out.println("Hello print"); %>

<%!
  String generateFilename(String filename, int tails) {
    int offset = filename.indexOf(".");
    String name = filename.substring(0, offset);
    String ext = filename.substring(offset + 1);

    return String.format("%s_%d.%s", name, tails, ext);
  }
%>

<%
  System.out.println("X-File-Name: " + request.getHeader("X-File-Name"));
  System.out.println("X-File-Size: " + request.getHeader("X-File-Size"));
  
  String profileDir = application.getRealPath("/profile/temp");
  String filename = request.getHeader("X-File-Name");
  File profile = new File(profileDir, filename);

  if (!profile.getParentFile().exists()) {
    profile.getParentFile().mkdirs();
  }

  for (int i = 0; profile.exists(); i++) {
    profile = new File(profileDir, generateFilename(filename, i));
  }
  
  profile.createNewFile();
  
  FileOutputStream fos = new FileOutputStream(profile);
  InputStream is = request.getInputStream();
  byte[] buffer = new byte[1024];
  int offset = 0;
  while ((offset = is.read(buffer)) != -1) {
    fos.write(buffer, 0, offset);
  }
  fos.close();
  
  out.write(String.format("{ path: '%s' }", application.getContextPath() + "/profile/temp/" + profile.getName()));
%>
<% System.out.println("End file..."); %>