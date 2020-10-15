<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZufOba</title>
</head>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
    .container{
        max-width: 80%;
        background-color: rgb(228, 195, 195);
        margin: auto;
        padding: 23px;
    }
</style>
<body>
    <div class="container">
       <h1>Welcome to our World!!</h1>
       <?php
          $age = 34;
          if($age >= 18){
              echo "You can vote.";
          }
          else{
              echo "You cannot vote.";
          }
          
          $languages = array("Python", "PHP", "C++", "Ruby");
          echo $languages[1];
          echo count($languages);

          $a=0;
          while ($a < count($languages)) {
               echo "<br> The value of language is : ";
               echo $languages[$a];
               $a++;
          }

          foreach($languages as $value){
               echo "<br> The value is ";
               echo  $value;
          }
       ?>
    </div>
</body>
</html>