<html>
	<head>
		<title>
			Name App
		</title>
		<style>
			*{
				font-size:40px;
				text-align:center;
			}
			body{
				background-color:linen;
			}
		</style>
	</head>
	<body>
		<h1>Name App by Vedant</h1>
		<form>
			<input type="text" name="name" placeholder="Enter Your Name"/>
			<br/><br/>
			<input type="submit" name="btn"/>
		</form>
		<%
			if(request.getParameter("btn")!=null)
			{
				String name=request.getParameter("name");
				
				if(name.equals(""))
				{
					out.println("naam nhi hai kya");
					return;
				}

				if(!name.matches("^[A-Za-z ]+$"))
				{
					out.println("Kaunse gruh se aye ho");
					return;
				}
			
				java.time.LocalDateTime dt=java.time.LocalDateTime.now();
				int hr=dt.getHour();
				String msg="";
				if(hr<12)
					msg="Good Morning "+name;
				else if(hr<4)
					msg="Good Afternoon "+name;
				else
					msg="Good Evening "+name;
				out.print(msg);
			}
		%>
	</body>
</html>