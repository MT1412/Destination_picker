module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
         <div class="welcomeContent">
                  <form method="GET" action="/CalculateAction">
                      <label for="winddirection">Select the expected wind direction:</label><br/>
                      <select id="winddirection" name="winddirection">
                          <option style="display:none"></option>
                          <option value="0">N</option>
                          <option value="45">NE</option>
                          <option value="90">E</option>
                          <option value="135">SE</option>
                          <option value="180">S</option>
                          <option value="225">SW</option>
                          <option value="270">W</option>
                          <option value="315">NW</option>
                      </select><br><br>
                      <label for="windstrength">Select the expected wind strength (bft):</label><br/>
                      <select id="windstrength" name="windstrength">
                          <option style="display:none"></option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                      </select><br><br>
                      <input type="submit" id="submitbutton" value="Submit">
                  </form>
         </div>
|]