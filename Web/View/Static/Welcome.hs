module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
         <div class="welcomeContent">
                  <form method="GET" action="/CalculateAction">
                      <label for="numberinput">Enter the expected wind direction (0 - 360):</label><br/>
                      <input type="number" id="winddirection" name="winddirection"><br><br>
                      <input type="submit" id="submitbutton" value="Submit">
                  </form>
         </div>
|]