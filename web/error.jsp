<%-- 
    Document   : error
    Created on : Jan 6, 2024, 5:12:28 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* fonts */
@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@500&family=Roboto&display=swap');

/* Css reset */
*{
  border: 0;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
}


/* 
font-family: 'Oswald', sans-serif; */
/* font-family: 'Roboto', sans-serif; */


body{
  height: 100dvh;
  display: grid;
  place-items: center;
}

main{
  width: 65%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  gap: 1em;
}
img{
  width: 20em;
}


.oops p{
  font-family: 'Oswald', sans-serif;
  font-weight: 700;
  font-size: 1.5rem;
}

.error-msg p {
  font-weight: 400;
  font-family: 'Roboto', sans-serif; 
  font-size: 1.2rem;
}

button{
  padding: 0.5em 2em;
  border-radius: 0.4em;
  font-weight: 700;
  font-size: 1.2rem;
  font-family: 'Oswald', sans-serif;
  background-color: lightblue;
  letter-spacing: 2px;
}

a{
  color: white;
}
        </style>
    </head>
    <body>
      <main>
          <div style="display: flex;">
              <img src="./assets/img/number-4.png" alt="">
        <img class="zero" src="./assets/img/zero.png" alt="">
        <img class="four-b" src="./assets/img/number-4.png" alt="">
          </div>
        
        <!-- configure the image -->
        <!-- <img src="404-error.png" alt="">  -->
      <div class="oops">
        <p>Oops! This Page Could Not Be Found</p>
      </div>

      <div class="error-msg">
        <p>
          SORRY BUT THE PACE YOU ARE LOOKING FOR DOES NOT EXIST, HAVE BEEN
          REMOVED NAME CHANGED OR IS TEMPORARILY UNAVAILABLE. <%= exception %>
        </p>
      </div>

      <div class="back-btn">
        <button><a href="#">GO TO HOMEPAGE</a></button>
      </div>
    </main>
        
    </body>
</html>