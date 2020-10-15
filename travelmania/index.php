<?php
   $insert = false;
   if(isset($_POST['name'])){
   $server = "localhost";
   $username = "root";
   $password = "";

   $con = mysqli_connect($server, $username, $password);

   if(!$con){
       die("Connection to the database failed due to".mysqli_connect_error());
   }
   //echo "Connection Successful!";

   $name = $_POST['name'];
   $age = $_POST['age'];
   $gender = $_POST['gender'];
   $email = $_POST['email'];
   $phone = $_POST['phone'];
   $desc = $_POST['desc']; 

   $sql= "INSERT INTO `travel`.`travel` (`NAME`, `AGE`, `GENDER`, `EMAIL`, `PHONE`, `OTHERS`, `SUBMITTED_ON`) 
   VALUES ('$name', '$age', '$gender', '$email', '$phone', '$desc', current_timestamp()); ";
  //echo $sql;

   if($con->query($sql) == true){
       //echo "Successfully inserted.";
       $insert = true;
   }
   else{
       echo "Error : $sql <br> $con->error";
   }

   $con->close();

   }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Travel Form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Sriracha&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <img class="bg" src="parachute.jpg" style="height:100%"alt="travel">
   <div class="container">
       <h1>Welcome to Travelmania</h1>
       <p>Enter your details to confirm participation.</p>
       <?php
        if($insert == true){
        echo "<p class='subMsg'>Thanks for submitting your form.</p>";
        }
    ?>

       <form method="POST">
           <input type="text" name="name" id="name" placeholder="Enter your name " required>
           <input type="number" name="age" id="age" placeholder="Enter you age " required>
           <select name="gender" id="gender" style='    width: 80%;
    margin: 11px auto;
    padding: 7px;
    font-size: 16px;
    border: 2px solid black;
    border-radius: 6px;' required>
           <option>Please select your gender</option>
            <option value='male'>Male</option>
            <option value='female'>Female</option>
            <option value='other'>Other</option>
            </select>
           <input type="email" name="email" id="email" placeholder="Enter you email " required>
           <input type="number" name="phone" id="phone" placeholder="Enter you phone ">
           <textarea name="desc" id="desc" cols="30" rows="10" placeholder="Enter any other information here "></textarea>
           <button class="btn" onclick='validateEmailIfGoogle()'>Submit</button>
       </form>
   </div> 
   <script src="index.js"></script>
</body>
</html>