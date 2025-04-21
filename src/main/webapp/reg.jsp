<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="AddUser" method="POST">
	
	<label>Full name</label><br>
	<input type="text" name="fullname"><br>
	
	<label>Email</label><br>
	<input type="email" name="email"><br>
	
	<label>Phone</label><br>
	<input type="text" name="phone"><br>
	
	<label>Address</label><br>
	<input type="text" name="address"><br><br>
	
	<label>Gender</label><br>
    <select name="gender">
      <option value="">Select</option>
      <option value="Male">Male</option>
      <option value="Female" >Female</option>
      <option value="Other" >Other</option>
    </select><br><br>
	
	<label>Blood Group</label><br>
	<select name="bloodgroup">
       <option value="">Select</option>
       <option value="A+">A+</option>
       <option value="A-">A-</option>
       <option value="B+">B+</option>
       <option value="B-">B-</option>
       <option value="O+">O+</option>
       <option value="O-">O-</option>
       <option value="AB+">AB+</option>
       <option value="AB-">AB-</option>
       <option value="Unknown">Unknown</option>
     </select><br><br>
     
     <label class="block text-sm font-medium text-gray-700 mb-2">Existing Medical Conditions</label><br>
          
     <input type="checkbox" name="conditions" value="Diabetes" /> Diabetes
     <input type="checkbox" name="conditions" value="Hypertension" /> Hypertension
     <input type="checkbox" name="conditions" value="Asthma" /> Asthma<br><br>
     
     <label>Password</label>
     <input type="password" name="password"/><br><br>
     
     <label>Confirm Password</label>
     <input type="password" name="confirmPassword"/><br><br>
     
     <button type="submit">Submit</button>
	
</form>

</body>
</html>