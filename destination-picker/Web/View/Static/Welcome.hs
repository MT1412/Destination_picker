module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
         <div style="background-color: #657b83; padding-top: 2rem; padding-bottom: 2rem; color:hsla(196, 13%, 96%, 1); border-radius: 4px">
              <div style="max-width: 800px; margin-left: auto; margin-right: auto">
                  <form method="GET" action="/CalculateAction">
                      <label for="numberinput">Enter a number:</label>
                      <input type="number" id="numberinput" name="numberinput"><br><br>
                      <input type="submit" value="Submit">
                  </form>
              </div>
         </div>
|]